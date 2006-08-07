��    �      $  �   ,
      �  �   �  C  K  �   �  B  V  �  �  �  H  �   �  '   h  *   �     �     �     �     �          "  .   =     l     {     �  
   �     �     �     �  -         .  ,   7  ,   d     �  '   �     �     �  *   �  D        ]  "   x     �  T   �     �       
   *  o   5  <   �  #   �       3     /   N     ~     �     �  $   �  $   �  "     "   &     I     _     w     �  	   �     �  '   �  #   �  	   �       '     	   6     @  $   X     }     �     �  E   �                 7      F   F   \   M   �   U   �   E   G!  s   �!  I   "  M   K"  H   �"  !   �"  8   #  X   =#     �#     �#  H   �#  C   �#     ,$     E$     U$     k$     �$     �$     �$  e   �$  @   %     ]%     a%  ,   s%  &   �%     �%     �%  <   �%  ?   9&     y&  G   �&     �&     �&     �&     �&     '     '  
   '      '     -'     :'     R'     l'  
   x'  '   �'     �'  #   �'     �'     �'     �'      (     (     (     '(  
   5(     @(     Z(     c(     u(     ~(  &   �(     �(     �(     �(  
   �(  0   �(  
   )     )     +)     4)     Q)     T)     [)     h)     z)     �)  	   �)     �)  
   �)     �)  	   �)     �)  .  �)  Q   +  �   l+  �   C,     �,  �  .  T  �/  �   �4  :   �5  /   �5     6     6     06     H6  $   Z6  $   6  /   �6     �6  $   �6     7     )7     D7     Y7  0   l7  J   �7     �7  )   �7  1   $8     V8  =   r8     �8  
   �8  @   �8  B   9  "   R9  3   u9     �9  �   �9     P:     j:  	   |:  �   �:  F   ;  +   X;     �;  ;   �;  1   �;     <     "<     8<  &   P<  (   w<  &   �<  &   �<     �<     	=     #=  
   <=     G=     W=      j=  )   �=     �=     �=  ,   �=  	    >     
>  6   &>     ]>     }>  !   �>  B   �>     �>     ?     *?  !   <?  Q   ^?  O   �?  Q    @  K   R@  �   �@  R   <A  W   �A  H   �A     0B  @   PB  [   �B     �B     �B  b   �B  O   _C     �C     �C     �C     �C     D  $   .D  	   SD  q   ]D  J   �D     E     E  C   9E  (   }E     �E     �E  =   �E  ;   F     NF  Q   aF     �F  
   �F     �F     �F     �F     �F  
   �F     G  
   G     G  "   9G     \G     kG  $   oG  
   �G  4   �G  $   �G     �G      H     H     H     #H     7H     DH     RH  
   nH     yH     �H     �H  ,   �H     �H     �H     �H     �H  <   �H     8I     JI     XI  &   aI     �I     �I     �I     �I     �I     �I     �I     �I     �I     �I     J     J         L       �   4   $   M   n       P   F   o   a   {   �      v   <   �   O       g          s      
               @   ,   /   X   �   `      �       I                      �   9              %   J   ]   p       y                j   f   Y   �   �   ?       [   "       �   �   �   :      5   c       C   �   �   u   =   S       ~   #                 U   D   E   '   �       W   }   �           z       e      �   \      �   K   &         T   7   m   �   ^                           t   d   b   �   h   (   l               !   8      2   �   �       �           q      Q       x          V   B              6       �   N           3   >   0   |   �   �       A           .   +       �       �   1   _   )   H             w           �   �   G         	      R       k          �         �   �      ;           �       r   *   Z           -   �           i    
   The "login" command establishes an ongoing server session that preserves client identity
   and authorization information during the duration of the session. 
   The EPP "check" command is used to determine if an object can be
   provisioned within a repository.  It provides a hint that allows a
   client to anticipate the success or failure of provisioning an object
   using the "create" command as object provisioning requirements are
   ultimately a matter of server policy.
 
   The EPP "create" command is used to create an instance of an object.
   An object can be created for an indefinite period of time, or an
   object can be created for a specific validity period.
 
   The EPP "info" command is used to retrieve information associated
   with an existing object. The elements needed to identify an object
   and the type of information associated with an object are both
   object-specific, so the child elements of the <info> command are
   specified using the EPP extension framework.
 
   The EPP "transfer" command provides a query operation that allows a
   client to determine real-time status of pending and completed
   transfer requests.
   The EPP "transfer" command is used to manage changes in client
   sponsorship of an existing object.  Clients can initiate a transfer
   request, cancel a transfer request, approve a transfer request, and
   reject a transfer request using the "op" command attribute.
 
${BOLD}${GREEN}Session commands:${NORMAL}
${BOLD}connect${NORMAL} (or directly login) ${CYAN}# connect to the server (for test only)${NORMAL}
${BOLD}lang${NORMAL} cs ${CYAN}# set language of the incomming server messages. It MUST be set BEFORE send login! Later has no effect.${NORMAL}
${BOLD}validate${NORMAL} [on/off] ${CYAN}# set validation or display actual setting${NORMAL}
${BOLD}poll-ack${NORMAL} [on/off] ${CYAN}# send "poll ack" straight away after "poll req"${NORMAL}
${BOLD}raw-c${NORMAL}[ommand] [xml]/${BOLD}d${NORMAL}[ict] ${CYAN}# display raw command${NORMAL} (instead of raw you can also type ${BOLD}src${NORMAL})
${BOLD}raw-a${NORMAL}[nswer] [xml]/${BOLD}d${NORMAL}[ict]  ${CYAN}# display raw answer${NORMAL}
${BOLD}confirm${NORMAL} ${BOLD}on${NORMAL}/[off]  ${CYAN}# confirm editable commands befor sending to the server${NORMAL}
${BOLD}config${NORMAL} ${CYAN}# display actual config${NORMAL}
${BOLD}config${NORMAL} ${BOLD}create${NORMAL} ${CYAN}# create default config file in user home folder.${NORMAL}
${BOLD}send${NORMAL} [filename] ${CYAN}# send selected file to the server (for test only). If param is not valid file the command shows folder.${NORMAL}
 ${BOLD}${YELLOW}Start interactive input of params. To break type: ${NORMAL}${BOLD}!${NORMAL}[!!...] (one ${BOLD}!${NORMAL} for scope) (Value can be a list of max %d values.) (Value can be an unbouded list of values.) Actual config is Answer source Available EPP commands Available values Certificate key file not found. Certificate names not set. Certificates missing. Try connect without SSL! Command source Command was sent to EPP server. Confirm has been set to Confirm is Connection broken Connection closed Create default config failed. Default config file saved. For more see help. Dir list Do you want send this command to the server? Document has wrong encoding. LookupError: %s EPP document is not valid End of interactive input. [press enter] Example of input Examples Fatal error: Create default config failed. For connection to the EPP server type "connect" or directly "login". For disable validator type For help type "help" (or "h", "?") For more type For stop interactive input type ! instead of value (or more "!" for leave sub-scope) Greeting message incomming Help for command IP address If this script runs under MS Windows and timeout is not zero, it is probably SLL bug! Set timeout back to zero. Impossible create connection. Required config values missing Impossible saving conf file. Reason Init SSL connection Instead "command" Select one from this list bellow: Internal Error: Master node '%s' doesn't exist. Interpreted answer Interpreted command Interrupt from user Invalid XML document. ExpatError: %s Invalid bracket definition (childs). Invalid bracket definition (list). Invalid bracket definition (mode). Invalid input format. Invalid parameter index Invalid response code LIST of DNS Load file Login failed Missing result in the response message. Missing values. Required minimum is No config No data No response. EPP Server doesn't answer. Not found Open connection on host Param MUST be a value from this list Private key file not found. Send logout Server answer is not valid! Server doesn't return Greeting message. Contact server administrator. Session language is Session language was set to Start session! Status: Validation is Temporary file for verify XML EPP validity cannot been created. Reason The EPP "delete" command is used to remove an instance of an existing object. The EPP "hello" request a "greeting" response message from an EPP server at any time. The EPP "logout" command is used to end a session with an EPP server. The EPP "poll" command is used to discover and retrieve service messages queued by a server for individual clients. The EPP "renew" command is used to extend validity of an existing object. The EPP "update" command is used to update an instance of an existing object. The server configuration is not valid. Contact the server administrator. This language code is not allowed This program needs Python 2.4 or higher. Your version is To start the interactive mode of input the command params type: ${BOLD}!command${NORMAL} Try Type Type "?command" (or "h(elp) command") for mode details about parameters. Unknown EPP command. Select one from EPP commands list (Type help). Unknown EPP command: %s. Unknown command Unknown language code Unknown parameter name Unknown response type Unknown server response Usage Usage: python ccreg_console.py [host] [lang] # (lang is only cs/en and it can be also set befor host) Used certificat is not signed by verified certificate authority. VAT Validation is set Validator has been disabled. For enable type Value "%s" is not allowed here. Valid: Welcome to the ccReg console You are logged already. You are not connected! For connection type: connect or login You are not connected! Type login for connection to the server. You are not connected. You are not logged. You must call login() before working on the server. accept only values add part address change part city contact contact ID contact name country code current expiration date disclose flag (default y) domain name fax number index of message, required with op=ack! list of DNS list of values overflow. Maximum is list with max %d items. missing name new password not disclose notify email nsset address nsset name number of months or years optional organisation name password period period unit (y year(default), m month) poll ack is postal code postal informations query type readline module missing - cmd history is diabled registrant remove part required required only if part is set sp street tech contact technical contact unbounded list voice (phone number) your city your contact ID your email your login name your name your password Project-Id-Version: 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2006-08-04 09:43+0200
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: Zdeněk Böhm <zdenek.bohm@nic.cz>
Language-Team: CS <info@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
EPP příkaz "login" identifikuje uživatele a zahájí spojení s EPP serverem. 
   EPP Příkaz "check" se používá ke zjištění jestli se daný objekt
   v repozitáři nachází. To umožňuje řídit spouštění příkazu "create"
   a poté vyhodnotit jestli příkaz uspěl nebo ne.
 
   EPP příkaz "create" se používá pro vytvoření instance objektu.
   Objekt může být vytvořen na neučitý časový úsek nebo na přesně
   definované období.
 
   EPP příkaz "info" se používá ke zjištění informací spojených
   s vybraným objektem. Způsob identifikace objektu a typu
   navrácených informací spojených s objektem závisí na konkrétním
   typu info příkazu a případném použití EPP extension rozšíření.
 
   EPP příkaz "transfer" umožňuje zjišťovat aktuální stav
   nevyřízených anebo dokončených požadavků na transfer.
   Příkaz "transfer" se používá k ovládání změn
   na vybraném objektu. Klient může vyvolat požadavek
   na transfer. Nebo může požadovat zrušení požadavku, potvrzení
   požadavku a nebo odebrání požadavku. To vše pomocí atributu "op".
 
${BOLD}${GREEN}Příkazy relace (session):${NORMAL}
${BOLD}connect${NORMAL} (nebo přímo login) ${CYAN}# připojení k serveru(jen pro testování)${NORMAL}
${BOLD}lang${NORMAL} cs ${CYAN}# nastavení jazyka, kterým bude server odpovídat.MUSÍ být nastaven PŘED odesláním login! Pak již nemá žádný efekt.${NORMAL}
${BOLD}validate${NORMAL} [on/off] ${CYAN}# nastavení validace nebo zjištění aktuálního stavu${NORMAL}
${BOLD}poll-ack${NORMAL} [on/off] ${CYAN}# pošle "poll ack" hned za příkazem "poll req"${NORMAL}
${BOLD}raw-c${NORMAL}[ommand] [xml]/${BOLD}d${NORMAL}[ict] ${CYAN}# zobrazit zdrojový tvar příkazu${NORMAL} (místo raw můžete zadat také ${BOLD}src${NORMAL})
${BOLD}raw-a${NORMAL}[nswer] [xml]/${BOLD}d${NORMAL}[ict]  ${CYAN}# zobrazit zdrojový tvar odpovědi${NORMAL}
${BOLD}confirm${NORMAL} ${BOLD}on${NORMAL}/[off]  ${CYAN}# potvrzení editačních příkazů před odesláním na server${NORMAL}
${BOLD}config${NORMAL} ${CYAN}# zobrazení aktuálních hodnot v config souboru (nebo defaultu)${NORMAL}
${BOLD}config${NORMAL} ${BOLD}create${NORMAL} ${CYAN}# vytvoření defaultního config souboru v adresáři uživatele (user home).${NORMAL}
${BOLD}send${NORMAL} [jméno] ${CYAN}# odešle soubor daného jména na server (jen testování). Pokud jméno není platný soubor, tak příkaz zobrazuje adresář.${NORMAL}
 ${BOLD}${YELLOW}Start interaktivního zadávání parametrů. Pro ukončení zadejte: ${NORMAL}${BOLD}!${NORMAL}[!!...] (jeden ${BOLD}!${NORMAL} pro každou podskupinu) (Hodnota může být seznam o max. velikosti %d položek.) (Hodnota může být libovolně velký seznam.) Aktuální config je Zdrojová odpověď Dostupné EPP příkazy Povolené hodnoty Soubor s certifikátem nebyl nalezen Jména certifikátů nejsou zadána  Certifikát chybí. Zkouším spojení bez SSL! Zdrojový příkaz Příkaz byl odeslán na EPP server. Potvrzení bylo nastaveno na Potvrzení je nastaveno na Spojení přerušeno Spojení uzavřeno Vytvoření defaultního config souboru selhalo. Defaultní config soubor byl uložen. Další informace naleznete v helpu. Výpis adresáře Chcete odeslat tento poříkaz na server? Dokument má chybné kódování. LookupError: %s EPP dokument není validní Konec interaktivního zadání parametrů. [stiskněte enter] Příklad zadání Příklady Fatální chyba: Vytvoření defaultních config hodnot selhalo. Pro spojení s EPP serverem zadejte "connect" nebo rovnou "login". Pro deaktivaci validátoru zadejte Pro více informací zadejte "help" (nebo "h", "?") Pro více informací zadejte Interaktivní zadávání parametrů se přeruší zadáním "!" (nebo vícevykřičníků najednou, když jste v podskupině parametrů) Přišla Greeting zpráva Help pro příkaz IP adresa Jestliže tento skript běží v MS Windows a timeout není nula, tak se pravděpodobně jedná o SSL bug! Nastavte timeout zpět na nulu. Není možné vytvořit spojení. Požadované hodnoty z config chybí Není možné uložit config soubor. Důvod Aktivováno SSL spojení Místo "příkaz" vyberte jeden z následujícího seznamu: Interní chyba: Nadřazený uzel '%s' neexistuje. Přeložená odpověď Přeložený příkaz Přerušeno uživatelem Neplatný XML dokument. ExpatError: %s Nesprávné použití závorek (childs). Nesprávné použití závorek (list). Nesprávné použití závorek (mode). Neplatný vstupní formát Neplatný index parametru Neplatný kód odpovědi Seznam DNS Načíst soubor Login se nezdařil V odpovědi chybí část result Chybí parametry. Požadované minimum je Žádný config Žádná data Žádná odpověď. EPP server neodpovídá. Nenalezen Navázáno spojení na host Parametr MUSÍ být hodnota z následujícího seznamu Privátní klíč nebyl nalezen Odeslán logout Odpověď serveru není validní! Server nevrátil Greeting odpověď. Kontaktujte správce serveru. Nastavený jazyk relace je Jazyk relace byl nastaven na Relace zahájena! Aktuální nastavení validace je Dočasný soubor pro ověření XML EPP validity se nepodařilo vytvořit. Důvod EPP příkaz "delete" se používá pro odebrání instance vybraného objektu. EPP příkazem "hello" si lze kdykoliv vyžádat od serveru odpověď "greeting". EPP příkaz "logout" se používá pro ukončení spojení s EPP serverem. EPP příkaz "poll" se používá k odběru servisních zpráv pro přihlášeného uživatele a ke zjištění počtu těchto zpráv uložených ve frontě. EPP příkaz "renew" se používá pro prodloužení platnosti vybraného objektu. EPP příkaz "update" se používá pro aktualizaci hodnot instance vybraného objektu. Server není správně nakonfigurován. Obraťte se na správce serveru. Tento kód jazyka není povolen Tento program vyžaduje Python 2.4 nebo vyšší. Vaše verze je Interaktivní režim zadávání parametrů příkazu se spustí: ${BOLD}!příkaz${NORMAL} Zkuste Zadejte Více informací o parametrech příkazu získáte zadáním "?příkaz" (nebo "h(elp) příkaz"). Neznámý EPP příkaz. Vyberte jeden ze seznamu EPP příkazů (zadejte help). Neznámý EPP příkaz: %s. Neznámý příkaz Neznámý kód jazyka Neznámé jméno parametru Neznámý typ části response Odpověď serveru nebyla rozpoznána Použití Použití: python ccreg_console.py [host] [lang] # (lang může být pouze cs/en a může být zadán před host) Použitý certifikát není podepsán uznávanou certifikační autoritou. DPH Validace byla nastavena na Validátor byl deaktivován. Opětná aktivace se provede zadáním Hodnota "%s" není povolena. Platná je: Vítejte v ccReg konzoli Jste již zalogován Nejste připojeni! Po připojení zadejte: connect nebo login Nejste připojeni! Pro připojení k serveru zadejte login. Nejste připojeni. Nejste zalogováni. Před samotnou prací na serveru musíte volat funkci login() povoleny pouze hodnoty část add adresa část change město kontakt kontakt ID jméno kontaktu kód země aktuální datum expirace přepínač zveřejnit (default y) jméno domény fax index zprávy, povinné při op=ack! seznam DNS Počet položek v seznamu je překročen. Maximum je seznam o maximálně %d položkách. chybí jméno nové heslo nezveřejňovat oznámení na email nsset adresa jméno nssetu počet měsíců nebo roků nepovinný název organizace heslo období jednotka období (y rok(default), m měsíc) poll ack je PSČ poštovní informace typ požadavku readline modul chybí - historie příkazů je deaktivována vlastník domény část remove povinný povinný jen je-li tato část zadána č.p. ulice tech. kontakt technický kontakt libovolně velký seznam telefon město vaše kontaktní ID váš email vaše login jméno vaše jméno vaše heslo 