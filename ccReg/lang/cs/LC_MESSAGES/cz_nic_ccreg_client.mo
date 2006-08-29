��    �      L    |      �  �   �  C  S  �   �  B  ^  �  �  �   P  '   +  *   S  P   ~     �     �     �             !   1  )   S      }     �     �  9   �  4     )   H     r     �     �     �  
   �     �     �     �  _    *   k     �     �  -   �     �  %   �  &        D     U     f  %   �  ,   �  ,   �               %  '   .     V     ^  *   o     �  !   �     �     �  
   �  o      #   q      �   -   �   /   �      !      !     4!  $   H!  $   m!  "   �!  "   �!  E   �!     "     4"     L"     b"  	   n"     x"     �"  8   �"  '   �"  #   #  +   (#  d   T#  	   �#     �#     �#     �#  	   �#  %   $     .$     6$  -   K$     y$  /   �$  F   �$     %     %     4%     Q%  
   n%     y%     �%  ;   �%  /   �%  M   �%  9   C&  D   }&     �&     �&  D   �&  4   2'  H   g'  7   �'  M   �'  M   6(  U   �(  Y   �(  E   4)  s   z)  I   �)  M   8*  ;   �*     �*     �*     �*  6   �*  9   +     X+  C   u+     �+     �+     �+     �+     ,     ,     ,     .,  2   D,  $   w,     �,  @   �,     �,  ?   -     E-  %   \-  G   �-     �-     �-     �-     .     
.     .  
   .  
   &.     1.     >.     K.  #   c.     �.     �.     �.  
   �.  '   �.     �.  #   �.     /     1/     9/     >/     K/     X/  
   f/     q/     �/     �/     �/     �/  &   �/     �/     �/     �/  
   	0  
   0     0     +0     40     Q0     T0     f0     m0     z0     �0     �0  	   �0     �0  
   �0     �0  	   �0     �0  .  �0  Q   ,2  �   ~2  �   U3     4  �  &5  �   �6  :   �7  /   �7  V   �7     G8     \8     p8     �8     �8  >   �8  0   �8  3   &9  $   Z9  $   9  J   �9  /   �9  %   :     E:  $   X:     }:     �:     �:     �:     �:     �:  D  ;  &   P>  0   w>     �>  X   �>     ?  !   ?  !   ;?     ]?     o?  5   �?  +   �?  )   �?  1   @     ?@     [@  
   a@  =   l@  	   �@     �@  K   �@  -   A     AA     \A     yA  	   �A  �   �A  /   &B     VB  E   pB  1   �B     �B     �B     C  &   -C  (   TC  &   }C  &   �C  b   �C     .D     ID     cD  
   |D     �D     �D     �D  ?   �D      �D  )   E  ,   EE  k   rE     �E     �E     �E  ,   F  	   @F  &   JF  	   qF     {F  6   �F     �F  7   �F  ^   !G     �G     �G  '   �G     �G  $   �G     H     (H  Q   0H  1   �H  ^   �H  H   I  B   \I  !   �I     �I  P   �I  8   #J  U   \J  5   �J  Q   �J  O   :K  Q   �K  O   �K  K   ,L  �   xL  R   M  W   iM  @   �M     N  !   	N     +N  9   3N  G   mN  %   �N  O   �N     +O     >O     YO  $   xO  	   �O     �O     �O     �O  G   �O  (   *P     SP  7   kP     �P  ;   �P     �P  -   Q  5   5Q     kQ     �Q  
   �Q     �Q     �Q     �Q  
   �Q  
   �Q     �Q  
   �Q     �Q  &   R     4R  "   DR     gR     vR  $   zR  
   �R  4   �R  $   �R     S     S     S     S     2S     ?S     MS  
   iS     tS     �S     �S  ,   �S     �S     �S     �S     �S     �S     T     T  &   T     FT     LT     \T     bT     pT     �T     �T     �T     �T     �T     �T     �T     �T                �       �   �   �   <       s      �   �      �   �          e   (       �   .   h   �         �   7              �       {   &       �               >   P   %   z       �   9   �   i               6   b   O       m   �       �   j   V      Q   �       �   �           �   ~   =                             �   #      �   '   E   �           @   �   �             n      :           J   �   ^   N       �           �                �   �   �       D          �      B   *   �       �   a           C   �   d       �   0   �   �           ]              �           U   L   W   �   Z   y   -   $   �       w   A   v       �   �       \   !   M   4   _   �   �   �   �   I   o   )           ?       [   u       2   �      |             �   1   �   c       f       t       "       K   T       �   �      �   g           �   H       ;   5   �   �   	   �   �   R   �   G       �   `          q                   Y      �   �   x   3   �   8   ,   �   r   �   }   p   �   S   X   +   F   
   l      �         k   �   �   /       �        
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
    SSN types can be: 
      op       number identity card
      rc       number of birth
      passport number of passport
      mpsv     number of Ministry of Labour and social affairs
      ico      number of company (Value can be a list of max %d values.) (Value can be an unbouded list of values.) -c COMMAND, --command=COMMAND
                   send command to server and exit Actual config is Answer source Available EPP commands Available session commands Available values Available verbose modes: 1, 2r 3. Can not create connection. Missing values Can not save config file. Reason Certificate key file not found. Certificate names not set. Certificate not signed by verified certificate authority. Certificates missing. Trying to connect without SSL! Client for communication with EPP server. Colors mode is Command sent to EPP server. Command source Confirm has been set to Confirm is Connection broken Connection closed Connection interrupted. Connection options:
  -?, --help       show this help and exit
  -V, --version    Display program version information

  -l LANGUAGE, --lang=LANGUAGE
                   set user interface language
  -r, --colors     turn on colored output
  -v LEVEL, --verbose=LEVEL
                   set verbose level
                   1 - normal operation
                   2 - print more details
                   3 - print more details and display XML sources
  -h HOSTNAME, --host=HOSTNAME
                   ccReg server to connect 
  -u USERNAME, --user=USERNAME
                   authenticate to server as user
  -p PASSWORD, --password=PASSWORD
                   authenticate to server with password
  -s SESSION, --session=SESSION
                   read session name  used for connect to the EPP server
                   session values are read from config file Console for communication with EPP server. Create default config failed. DESCRIPTION Default config file saved. See help for more. Dir list Display XML source of the EPP answer. Display XML source of the EPP command. Display credits. Display license. Display or create config file. Display this help or command details. Do you want send this command to the server? Document has wrong encoding. LookupError: %s EPP document is not valid ERROR EXAMPLES End of interactive input. [press enter] Example Example of input Fatal error: Default config create failed. For list all commands type For more information, see README. For more type Help for command IP address If this client runs under MS Windows and timeout is not zero, it is probably SLL bug! Set timeout back to zero. If you don't fill item press ENTER. Incoming greeting message Interactive input params mode. For BREAK type Internal error: Master node '%s' doesn't exist. Interpreted answer Interpreted command Interrupted by user Invalid XML document. ExpatError: %s Invalid bracket definition (childs). Invalid bracket definition (list). Invalid bracket definition (mode). Invalid bracket. Only value or simple list allowed in key definition. Invalid input format. Invalid parameter index Invalid response code LIST of DNS Load file Login failed Logout command sent to server Make connection between client and server without login. Missing result in the response message. Missing values. Required minimum is Module for sending files to the EPP server. Names what are not included into disclose list are set to opposite value of the disclose flag value. No config No data No help available for No response from EPP server. Not found Not in registry: Object is available. OPTIONS Opened connection to Parameter MUST be a value from following list Private key file not found. Quit the client. Same effect has "q" or "exit". Readline module missing, command history diabled. For more see README. Report bugs to SSL connection initiated SSN (Security social number) SSN (Social security number) SSN number SSN type SYNTAX Same as help. For command details type "help command-name". Send "poll ack" straight away after "poll req". Send any file to the server. If filename missing command shows actual folder. Server configuration is not valid. Contact administrator. Server didn't return Greeting message. Contact server administrator. Server reply is not valid! Session started Set on/off confirmation for sending editable commands to the server. Set on/off external validation of the XML documents. Set verbose mode: 1 - brief (default); 2 - full; 3 - full & XML sources. Start the interactive mode of the input command params. Temporary file for XML EPP validity verification can not been created. Reason The EPP "delete" command is used to remove an instance of an existing object. The EPP "hello" request a "greeting" response message from an EPP server at any time. The EPP "list" command is used to list all ID of an existing object owning by registrant. The EPP "logout" command is used to end a session with an EPP server. The EPP "poll" command is used to discover and retrieve service messages queued by a server for individual clients. The EPP "renew" command is used to extend validity of an existing object. The EPP "update" command is used to update an instance of an existing object. This program requires Python 2.4 or higher. Your version is Try Turn on/off colored output. Type Type "help command" to get help on particular command. Type "help", "license" or "credits" for more information. Type %s to disable validator Unknown EPP command. Select one from EPP commands list (Type help). Unknown command Unknown parameter name Unknown response type Unknown server response Usage VAT VAT (Value-added tax) Validation process is Validator has been disabled. Type %s to enable it. Value "%s" is not allowed. Valid is: Verbose mode is You are connected already. Type disconnect for close connection. You are logged already. You are not connected! Type login for connection to the server. You are not connected. You are not logged. First type login. You are not logged. You must call login() before working on the server. You has been disconnected. accepts only values add part address change part city contact ID contact id contact name country code current expiration date data for with is set the flag value disclose disclose flag (default y) domain name fax number index of message, required with op=ack! list of DNS list of values overflow. Maximum is list with max %d items. missing name new password notify email nsset address nsset name number of months or years optional organisation name password period period unit (y year(default), m month) poll ack is postal code postal informations query type registrant remove part required required only if part is set sp state or province street tech contact technical contact unbounded list voice (phone number) your city your contact ID your email your login name your name your password Project-Id-Version: 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2006-08-29 17:32+0200
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
    SSN typ může být: 
      op       číslo občanského průkazu
      rc       rodné číslo
      passport číslo pasu
      mpsv     číslo Ministerstva práce a sociálních věcí
      ico      IČO (Hodnota může být seznam o max. velikosti %d položek.) (Hodnota může být libovolně velký seznam.) -c COMMAND, --command=COMMAND
                   odeslat příkaz na server a skončit Aktuální config je Zdrojová odpověď Dostupné EPP příkazy Dostupné session příkazy Povolené hodnoty Mód výstupu může být nastaven jen na hodnoty 1, 2 nebo 3. Není možné vytvořit spojení. Chybí hodnoty Není možné uložit konfigurační soubor. Důvod Soubor s certifikátem nebyl nalezen Jména certifikátů nejsou zadána. Použitý certifikát není podepsán uznávanou certifikační autoritou. Certifikát chybí. Zkouším spojení bez SSL! Klient pro komunikaci s EPP serverem. Mód barevnosti je Příkaz byl odeslán na EPP server. Zdrojový příkaz Potvrzení bylo nastaveno na Potvrzení je nastaveno na Spojení přerušeno Spojení uzavřeno Spojení bylo přerušeno. Parametry spojení:
  -?, --help       zobrazit tuto nápovědu a skončit
  -V, --version    zobrazit verzi programu

  -l LANGUAGE, --lang=LANGUAGE
                   nastavení jazykové verze
  -r, --colors     zapnout barevný výstiup
  -v LEVEL, --verbose=LEVEL
                   nastavení módu výpisu
                   1 - normální výstup
                   2 - zobrazit více detailů
                   3 - zobrazit více detailů a XML zdroje
  -h HOSTNAME, --host=HOSTNAME
                   ccReg server, na který se má navázat spojení
  -u USERNAME, --user=USERNAME
                   přihlašovací jméno
  -p PASSWORD, --password=PASSWORD
                   přihlašovací heslo
  -s SESSION, --session=SESSION
                   kolekce přihlašovacích hodnot z vybrané sekce v konfiguračním souboru Konzole pro komunikaci s EPP serverem. Vytvoření defaultního config souboru selhalo. POPIS Defaultní konfigurační soubor byl uložen. Další informace naleznete v nápovědě. Výpis adresáře Zobrazit XML zdroj EPP odpovědi. Zobrazit XML zdroj EPP příkazu. Zobrazit credits. Zobrazit licenci. Zobrazení nebo vytvoření konfiguračního souboru. Zobrazit tento help nebo detaily příkazu. Chcete odeslat tento poříkaz na server? Dokument má chybné kódování. LookupError: %s EPP dokument není validní CHYBA PŘÍKLADY Konec interaktivního zadání parametrů. [stiskněte enter] Příklad Příklad zadání Fatální chyba: Vytvoření defaultního konfiguračního souboru selhalo. Pro výpis celého seznamu příkazů zadejte Více informací v README. Pro více informací zadejte Nápověda pro příkaz IP adresa Jestliže tento klient běží v MS Windows a timeout není nula, tak se pravděpodobně jedná o SSL bug! Nastavte timeout zpět na nulu. Pokud nechcete položku zadat stiskněte ENTER. Přišla Greeting zpráva Mód interaktivního zadávání parametrů. Pro přerušení zadejte Interní chyba: Nadřazený uzel '%s' neexistuje. Přeložená odpověď Přeložený příkaz Přerušeno uživatelem Neplatný XML dokument. ExpatError: %s Nesprávné použití závorek (childs). Nesprávné použití závorek (list). Nesprávné použití závorek (mode). Neplatná závorka. V zadání hodnoty klíčem je povolena jen jedna hodnota nebo prostý seznam. Neplatný vstupní formát Neplatný index parametru Neplatný kód odpovědi Seznam DNS Načíst soubor Login se nezdařil Odeslán logout Navázání spojení mezi klientem a serverem bez zalogování. V odpovědi chybí část result Chybí parametry. Požadované minimum je Modul pro odeslání souborů na EPP server. Jména která nejsou uvedena v seznamu disclose, jsou nastavena na opačnou hodnotu než má disclose flag. Žádný config Žádná data Help nebyl nalezen pro Žádná odpověď. EPP server neodpovídá. Nenalezen Není v registru: Objekt je dostupný. PARAMETRY Navázáno spojení na Parametr MUSÍ být hodnota z následujícího seznamu Privátní klíč nebyl nalezen Ukončit klienta. Stený význam má i "q" nebo "exit". Readline modul chybí, historie příkazů deaktivována. Více informací naleznete v README. Poruchy zasílejte na Aktivováno SSL spojení SSN (číslo sociálního pojištění) SSN číslo dokladu SSN číslo (Security social number) SSN typ čísla dokladu SYNTAXE Stejné jako help. Pro zobrazení detailů příkazu zadejte "help command-name". Poslat "poll ack" ihned po odeslání "poll req". Odeslat soubor na server. Pokud jméno souboru není zadáno zobrazí se aktuální adresář. Server není správně nakonfigurován. Obraťte se na správce serveru. Server nevrátil Greeting odpověď. Kontaktujte správce serveru. Odpověď serveru není validní! Relace zahájena Zapnout/vypnout potvrzení procesu odeslání editačních příkazů na server. Zapnutí/vypnutí externího validátoru XML dokumentů. Nastavení módu výpisu: 1 - stručný (default); 2 - plný; 3 - plný & XML zdroje. Start režimu interaktivního vkládání parametrů. Dočasný soubor pro ověření XML EPP validity se nepodařilo vytvořit. Důvod EPP příkaz "delete" se používá pro odebrání instance vybraného objektu. EPP příkazem "hello" si lze kdykoliv vyžádat od serveru odpověď "greeting". EPP příkaz "delete" se používá pro odebrání instance vybraného objektu. EPP příkaz "logout" se používá pro ukončení spojení s EPP serverem. EPP příkaz "poll" se používá k odběru servisních zpráv pro přihlášeného uživatele a ke zjištění počtu těchto zpráv uložených ve frontě. EPP příkaz "renew" se používá pro prodloužení platnosti vybraného objektu. EPP příkaz "update" se používá pro aktualizaci hodnot instance vybraného objektu. Tento program vyžaduje Python 2.4 nebo vyšší. Vaše verze je Zkuste Zapnout/vypnout barevný výstup. Zadejte Zadejte "help command" pro zobrazení detailů příkazu. Zadejte "help", "license" or "credits" pro zobrazení více informací. Pro deaktivaci validátoru zadejte %s Neznámý EPP příkaz. Vyberte jeden ze seznamu EPP příkazů (zadejte help). Neznámý příkaz Neznámé jméno parametru Neznámý typ části response Odpověď serveru nebyla rozpoznána Použití DPH VAT (daňový identifikátor) Validace je nastavena na Validátor byl deaktivován. Opětná aktivace se provede zadáním %s. Hodnota "%s" není povolena. Platná je: Mód rozsahu výpisu je Již jste připojeni. Pro odpojení zadejte disconnect. Jste již zalogován Nejste připojeni! Pro připojení k serveru zadejte login. Nejste připojeni. Nejste zalogováni. Nejdříve zadejte login. Nejste zalogováni. Nejdříve musíte zadat login(). Spojení bylo ukončeno. povoleny pouze hodnoty část add adresa část change město kontakt ID kontakt id jméno kontaktu kód země aktuální datum expirace data, pro které se nastaví příznak nezveřejňovat přepínač zveřejnit (default y) jméno domény fax index zprávy, povinné při op=ack! seznam DNS Počet položek v seznamu je překročen. Maximum je seznam o maximálně %d položkách. chybí jméno nové heslo oznámení na email nsset adresa jméno nssetu počet měsíců nebo roků nepovinný název organizace heslo období jednotka období (y rok(default), m měsíc) poll ack je PSČ poštovní informace typ požadavku vlastník domény část remove povinný povinný jen je-li tato část zadána č.p. stát nebo kraj ulice tech. kontakt technický kontakt libovolně velký seznam telefon město vaše kontaktní ID váš email vaše login jméno vaše jméno vaše heslo 