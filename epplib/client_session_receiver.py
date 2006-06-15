# -*- coding: utf8 -*-
#!/usr/bin/env python
from gettext import gettext as _T
import eppdoc
import client_eppdoc
from client_session_base import *
from client_session_transfer import ManagerTransfer

SEPARATOR = '-'*60
COLOR = 1
ANSW_RESPONSE, ANSW_RESULT, ANSW_CODE, ANSW_MSG = range(4)

class ManagerReceiver(ManagerTransfer):
    """EPP client support.
    This class manage creations of the EPP documents.
    """
    def __init__(self):
        ManagerTransfer.__init__(self)
        self._raw_answer = None # XML EPP odpověd serveru
        self._dict_answer = None # dict - slovník vytvořený z XML EPP odpovědi

    def __put_raw_into_note__(self,data):
        "Use pprint for displaying structured data (dict, XML-EPP)."
        if data == None:
            self.append_note(_T('No data'),('RED','BOLD'))
        elif type(data) == dict:
            # Parsed data into dict
            self.append_note(eppdoc.prepare_for_display(data,COLOR))
        else:
            # XML EPP doc
            edoc = client_eppdoc.Message()
            edoc.parse_xml(data)
            if self._epp_response.is_error():
                # při parsování se vyskytly chyby
                self.append_note(edoc.get_errors(),'GREEN')
            else:
                self.append_note(edoc.get_xml(),'GREEN')

    #==================================================
    #
    # funkce pro uložení hodnot z odpovědi od serveru
    # process_answer() -> answer_response() -> answer_response_result()
    #                  -> answer_greeting()
    #
    #==================================================
    def __append_note_from_dct__(self,dict,cols):
        """Append columns values from dict to note stack.
        cols = ('column-name','column-name','column-name attr-name attr-name','node')
        """
        for column_name in cols:
            lcol = column_name.split(' ')
            if len(lcol)>1:
                value = eppdoc.get_dct_value(dict, lcol[0])
                attr = []
                for a in lcol[1:]:
                    attr.append('\t${BOLD}%s${NORMAL}\t%s'%(a,eppdoc.get_dct_attr(dict, lcol[0], a)))
                self.append_note('${BOLD}%s${NORMAL}\t%s\n%s'%(lcol[0],value,','.join(attr)))
            else:
                self.append_note('${BOLD}%s${NORMAL}\t%s'%(column_name,eppdoc.get_dct_value(dict, column_name)))

##    def __response_msg__(self, data, label):
##        "Shared for many answers. data=(response,result,code,msg)"
##        self.append_note('${BOLD}%s${NORMAL} ${%s}%s${NORMAL}'%(label, ('RED','GREEN')[data[ANSW_CODE] == '1000'], data[ANSW_MSG]))

    def __code_isnot_1000__(self, data, label):
        """Append standard message if answer code is not 1000.
        Returns FALSE - code is 1000; TRUE - code is NOT 1000;
        """
        if data[ANSW_CODE] != '1000':
            # standardní výstup chybového hlášení
            self.append_note('${BOLD}%s${NORMAL} ${%s}%s${NORMAL}'%(label, ('RED','GREEN')[data[ANSW_CODE] == '1000'], data[ANSW_MSG]))
##            self.__response_msg__(data, label)
        return data[ANSW_CODE] != '1000'

    def answer_response(self, dict_answer):
        "Part of process answer - parse response node."
        display_src = 1 # Má se odpověd zobrazit celá? 1-ano, 0-ne
        response = dict_answer.get('response',None)
        if response:
            result = response.get('result',None)
            if result:
                fnc_name = 'answer_response_%s'%self._command_sent.replace(':','_')
                if hasattr(self,fnc_name):
                    getattr(self,fnc_name)((dict_answer, result, eppdoc.get_dct_attr(result,(),'code'), eppdoc.get_dct_value(result,'msg')))
                    display_src = 0 # Odpověd byla odchycena, není potřeba ji zobrazovat celou.
                else:
                    # odpovědi na ostatní příkazy
                    self.append_note('%s: %s'%(_T('Server response'),self._command_sent),('GREEN','BOLD'))
            else:
                self.append_note(_T('Missing result in the response message.'),('RED','BOLD'))
        else:
            self.append_note(_T('Unknown server response:'),('RED','BOLD'))
        if display_src:
            # Pokud odpověd neodchytila žádná funkce, tak se odpověd zobrazí celá.
            self.__put_raw_into_note__(dict_answer)

    def process_answer(self, epp_server_answer):
        'Main function. Process incomming EPP messages. This funcion is called by listen socket.'
        if epp_server_answer:
            self._raw_answer = epp_server_answer
            # create XML DOM tree:
            self._epp_response.reset()
            self._epp_response.parse_xml(epp_server_answer)
            if self._epp_response.is_error():
                # při parsování se vyskytly chyby
                self.append_error(self._epp_response.get_errors())
            else:
                # validace
                invalid_epp = self.is_epp_valid(self._epp_response.get_xml())
                if invalid_epp:
                    # když se odpověd serveru neplatná...
                    self.append_note(_T('Server answer is not valid!'),('RED','BOLD'))
                    self.append_note(invalid_epp)
                    self.append_note('%s ${BOLD}validate off${NORMAL}.'%_T('For disable validator type'))
            if not self._epp_response.is_error():
                # když přišla nějaká odpověd a podařilo se jí zparsovat:
                self._dict_answer = self._epp_response.create_data()
                if self._dict_answer.get('greeting',None):
                    self.answer_greeting(self._dict_answer)
                elif self._dict_answer.get('response',None):
                    self.answer_response(self._dict_answer)
                else:
                    self.append_note(_T('Unknown response type:'),('RED','BOLD'))
                    self.__put_raw_into_note__(self._dict_answer)
        else:
            self.append_note(_T("No response. EPP Server doesn't answer."))
            self.__logout_session__()
        self.display() # zobrazení všech hlášení vygenerovaných během zpracování

    #==================================================
    #
    # Zpracování jednotlivých příchozích zpráv
    #
    #==================================================
    def answer_greeting(self, dict_answer):
        "Part of process answer - parse greeting node."
        greeting = dict_answer['greeting']
        self.append_note(SEPARATOR)
        self.append_note(_T('Greeting message incomming'),('GREEN','BOLD'))
        self.defs[LANGS] = eppdoc.get_dct_value(greeting, ('svcMenu','lang'))
        if type(self.defs[LANGS]) in (str,unicode):
            self.defs[LANGS] = (self.defs[LANGS],)
        self.append_note('%s: %s'%(_T('Available language versions'),', '.join(self.defs[LANGS])))
        self.append_note('%s objURI:\n\t%s'%(_T('Available'),eppdoc.get_dct_value(greeting, ('svcMenu','objURI'),'\n\t')))

    def answer_response_logout(self, data):
        "data=(response,result,code,msg)"
        self.append_note(data[ANSW_MSG])
        self.append_note(_T('You are loged out of the private area.'))
        self.__logout_session__()

    def answer_response_login(self, data):
        "data=(response,result,code,msg)"
        self.append_note(data[ANSW_MSG])
        if data[ANSW_CODE] == '1000':
            self._session[ONLINE] = 1 # indikátor zalogování
            self._session[CMD_ID] = 1 # reset - první command byl login
            self.append_note('*** %s ***'%_T('You are logged on!'),('GREEN','BOLD'))
            self.append_note('${BOLD}${GREEN}%s${NORMAL}\n%s'%(_T("Available EPP commands:"),", ".join(self._available_commands)))
        else:
            self.append_note('--- %s ---'%_T('Login failed'),('RED','BOLD'))

    def answer_response_contact_info(self, data):
        "data=(response,result,code,msg)"
        if self.__code_isnot_1000__(data, 'info:contact'): return
        try:
            resData = data[ANSW_RESPONSE]['response']['resData']
            contact_infData = resData['contact:infData']
            contact_postalInfo = contact_infData['contact:postalInfo']
            contact_disclose = contact_infData['contact:disclose']
        except KeyError, msg:
            self.append_error('answer_response_contact_info KeyError: %s'%msg)
        else:
            self.__append_note_from_dct__(contact_infData,
                ('contact:id','contact:roid','contact:status s'))
            self.append_note('${BOLD}contact:postalInfo${NORMAL} %s'%('-'*20))
            self.__append_note_from_dct__(contact_postalInfo,('contact:name','contact:org'))
            contact_addr = contact_postalInfo.get('contact:addr',None)
            if contact_addr:
                self.__append_note_from_dct__(contact_addr,('contact:street','contact:city','contact:cc'))
            self.append_note('-'*40)
            self.__append_note_from_dct__(contact_infData,('contact:email','contact:crID','contact:crDate','contact:upID','contact:upDate'))
            contact_disclose = contact_infData.get('contact:disclose',None)
            if contact_disclose:
                self.__append_note_from_dct__(contact_disclose,('contact:name','contact:org','contact:addr','contact:voice','contact:fax','contact:email'))

    def answer_response_domain_info(self, data):
        "data=(response,result,code,msg)"
        if self.__code_isnot_1000__(data, 'info:domain'): return
        try:
            resData = data[ANSW_RESPONSE]['response']['resData']
            domain_infData = resData['domain:infData']
        except KeyError, msg:
            self.append_error('answer_response_domain_info KeyError: %s'%msg)
        else:
            self.__append_note_from_dct__(domain_infData,
                ('domain:name','domain:roid','domain:status s','domain:registrant'
                ,'domain:contact type','domain:nsset','domain:clID','domain:crID'
                ,'domain:crDate','domain:exDate','domain:upID'))

    def answer_response_nsset_info(self, data):
        "data=(response,result,code,msg)"
        if self.__code_isnot_1000__(data, 'info:nsset'): return
        try:
            resData = data[ANSW_RESPONSE]['response']['resData']
            nsset_infData = resData['nsset:infData']
            nsset_ns = nsset_infData['nsset:ns']
        except KeyError, msg:
            self.append_error('answer_response_nsset_info KeyError: %s'%msg)
        else:
            self.__append_note_from_dct__(nsset_infData,('nsset:id','nsset:roid','nsset:clID','nsset:crID'
                ,'nsset:crDate','nsset:upID','nsset:trDate','nsset:authInfo'))
            self.append_note('${BOLD}nsset:ns${NORMAL} %s'%('-'*20))
            if type(nsset_ns) == list:
                for item in nsset_ns:
                    self.__append_note_from_dct__(item,('nsset:name','nsset:addr'))
            else:
                self.__append_note_from_dct__(nsset_ns,('nsset:name','nsset:addr'))


