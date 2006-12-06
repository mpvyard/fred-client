#!/usr/bin/env python
# -*- coding: utf8 -*-
#
# EPP Console for registrant
#
# Your terminal should support unicode. Check locale to LANG=cs_CZ.UTF-8
#
"""
This is module with main loop of the client console.
At the beginning after check Python version and command line
options module creates fred.ClientSession object witch handles
whole manipulation with environment variables and communication
with server.

This module provide console loop, waits for user input,
hands on user input to the fred.Client object and display out
all messages or server answers.

For testing purpose is possible to display profiller to show
duration of the particular processes. For enable this part of code
you have to uncomment corresponding lines with PROFILER.
"""
import sys, re, time
try:
    import readline
except ImportError:
    readline = None # for Unix like only

import __init__
from session_base import colored_output, VERBOSE
from translate import options, option_errors, script_name

help_option = _T("""
General options:
  -?, --help       Show this help and exit
  -V, --version    Display program version information and exit
  -l LANGUAGE, --lang=LANGUAGE
                   Set user interface language
  -v LEVEL, --verbose=LEVEL
                   Set verbose level
                   1 - normal operation
                   2 - print more details
                   3 - print more details and display XML sources
  -x, --no_validate
                   Disable client-side XML validation

Connection options:
  -f CONFIG, --config=CONFIG
                   Load configuration from config file
  -s SESSION, --session=SESSION
                   Use session from config file

  -h HOSTNAME, --host=HOSTNAME
                   Fred server host 
  -p PORT, --port=PORT
                   Server port (default: 700)
  -u USERNAME, --user=USERNAME
                   Authenticate to server as user
  -w PASSWORD, --password=PASSWORD
                   Authenticate to server with password
  -c CERTIFICATE --cert=CERTIFICATE
                   Use SSL certificate to connect to server
  -k PRIVATEKEY --privkey=PRIVATEKEY
                   Use SSL private key to connect to server

  -n, --nologin    
                   Disable automatic connection to server at start
""")
                   
def display_profiler(label, indent, debug_time):
    'For test only.'
    # For enable time uncomment all lines with PROFILER (and display_profiler)
    # and in translate module option 'timer'.
    msg, prev_t = debug_time[0]
    print '='*60
    print indent,label
    print '='*60
    for msg,t in debug_time[1:]:
        print indent,('%s:'%msg).ljust(30),'%02.4f sec.'%(t - prev_t)
        prev_t = t
    print indent,'-'*43
    print indent,'Total:'.ljust(30),'%02.4f sec.'%(t - debug_time[0][1])

def make_validation(epp, xml_epp_doc, label):
    """Make validation and join error message according by verbose mode
    Returns True - valid, False - invalid
    """
    error_message = epp.is_epp_valid(xml_epp_doc) # make validation on the XML document
    if error_message:
        v = epp.get_session(VERBOSE)
        epp.append_error(label)
        if v < 2: epp.append_error(_T('More details in verbose 2 or higher.'))
        if v > 1: epp.append_error(error_message)
        if v > 2: epp.append_error(xml_epp_doc)
    return (len(error_message) == 0)
    
def main(options):
    'Main console loop.'
    if __init__.translate.warning:
        print colored_output.render("${BOLD}${RED}%s${NORMAL}"%__init__.translate.warning)
    epp = __init__.ClientSession()
    if not check_options(epp): return # any option error occurs
    print epp.welcome()
    if not epp.load_config():
        epp.display() # display errors or notes
        return
    epp.init_radline(readline) # readline behavior for Unix line OS
    is_online = 0
    prompt = '> '
    online = prompt
    if not epp.automatic_login():
        epp.display() # display errors or notes
        return
    epp.restore_history()
    epp.display() # display errors or notes
    while 1:
        # change prompt status:
        if is_online:
            if not epp.is_logon():
                is_online = 0
                online = prompt
        else:
            online = prompt
            if epp.is_logon():
                is_online = 1
                online = '%s@%s> '%epp.get_username_and_host()
        try:
            command = raw_input(online).strip()
        except (KeyboardInterrupt, EOFError):
            break
        if command == '': continue
        if command in ('q','quit','exit'):
            epp.remove_from_history()
            epp.send_logout()
            break
        #debug_time = [('START',time.time())] # PROFILER
        command_name, epp_doc, stop_interactive_mode = epp.create_eppdoc(command)
        #debug_time.append(('Command created',time.time())) # PROFILER
        if command_name == 'q': # User press Ctrl+C or Ctrl+D in interactive mode.
            epp.send_logout()
            break
        if stop_interactive_mode:
            epp.display() # display errors or notes
            continue
        if command_name and epp_doc: # if only command is EPP command
            is_valid = make_validation(epp, epp_doc, _T('Command data XML document failed to validate.'))
            #debug_time.append(('Validation',time.time())) # PROFILER
            if not (epp.is_online(command_name) and epp.is_connected()):
                epp.append_note(_T('You are not connected.'),('BOLD','RED'))
            elif is_valid: # only if we are online and command XML document is valid
                epp.display() # display errors or notes
                if epp.is_confirm_cmd_name(command_name):
                    confirmation = raw_input('%s (y/N): '%_T('Do you really want to send this command to the server?'))
                    epp.remove_from_history()
                    if confirmation not in ('y','Y'): continue
                #debug_time.append(('Save and restore history',time.time())) # PROFILER
                epp.send(epp_doc)          # send to server
                #debug_time.append(('SEND to server',time.time())) # PROFILER
                xml_answer = epp.receive()     # receive answer
                #debug_time.append(('RECEIVE from server',time.time())) # PROFILER
                if epp.is_connected():
                    is_valid = make_validation(epp, xml_answer, _T('Server answer XML document failed to validate.'))
                    #debug_time.append(('Validation',time.time())) # PROFILER
                    try:
                        debug_time_answer = epp.process_answer(xml_answer) # process answer
                        #debug_time.append(('Parse answer',time.time())) # PROFILER
                    except (KeyboardInterrupt, EOFError):
                        debug_time_answer = []
                        break # handle Ctrl+C or Ctrl+D from testy user
                    epp.display() # display errors or notes
                    #debug_time.append(('Prepare answer for display',time.time())) # PROFILER
                    epp.print_answer()
                    #debug_time.append(('Display answer',time.time())) # PROFILER
                    #if options['timer']:
                    #    display_profiler('Main LOOP time profiler','',debug_time)
                    #    display_profiler('From Main LOOP only "Parse answer"','\t',debug_time_answer)
            if is_valid and command_name == 'logout':
                # only if we are online and command XML document is valid
                epp.close() # close connection but not client
        epp.display() # display errors or notes
    epp.close()
    epp.save_history()
    epp.display() # display logout messages
    print "[END]"

def check_options(epp):
    'Check options what needs epp object for validate.'
    retval=1
    if options['verbose']:
        if epp.parse_verbose_value(options['verbose']) is None:
            retval=0
            print _T("""%s
Usage: %s [OPTIONS...]
Try '%s --help' for more information.""")%(epp.fetch_errors(),script_name,script_name)
    return retval

if __name__ == '__main__':
    msg_invalid = __init__.check_python_version()
    if msg_invalid:
        print msg_invalid
    else:
        if options['help']:
            print '%s: %s [OPTIONS...]\n%s\n%s\n'%(_T('Usage'), 'fred_console',
            help_option,
            _T('For more information, see README.'))
        elif options['version']:
            epp = fred.ClientSession()
            print epp.version()
        else:
            if option_errors:
                print option_errors
            else:
                main(options)