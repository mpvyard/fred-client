#!/usr/bin/env python
# -*- coding: utf8 -*-
# Example: echo -en "check_domain nic.cz\ninfo_domain nic.cz" | ./fred_create.py
"""Create EPP XML document from command line parameters.
"""
import sys, re
from cgi import escape as escape_html
import fred
from fred.translate import options, option_args, config_error, encoding

epp = None
php_string = fred.session_transfer.php_string

def main(options):
    global epp
    if epp is None:
        epp = fred.ClientSession()
        epp.load_config()
        epp.set_auto_connect(0) # set OFF auto connection
    command_name, epp_doc, stop = epp.create_eppdoc(options['command'])
    errors = epp.fetch_errors()
    if not epp_doc and not errors: errors = _T('Unknown command')
    str_error = ''
    if errors:
        if type(command_name) == unicode: command_name = command_name.encode(encoding)
        if type(errors) == unicode: errors = errors.encode(encoding)
        if options['output'] == 'html':
            str_error = '<div class="fred_errors">\n<strong>%s errors:</strong>\n<pre>\n%s</pre><div>'%(command_name,escape_html(errors))
        elif options['output'] == 'php':
            str_error = '<?php\n$error_create_name = %s;\n$error_create_value = %s;\n?>'%(php_string(command_name),php_string(errors))
        else:
            # default 'text'
            str_error = "<?xml encoding='utf-8'?><errors>%s: %s</errors>"%(command_name,errors)
    return epp_doc, str_error

def display(epp_doc, str_error):
    if str_error:
        print str_error
    else:
        print epp_doc
  
if __name__ == '__main__':
    msg_invalid = fred.check_python_version()
    if msg_invalid:
        print msg_invalid
    else:
        if not sys.stdin.isatty():
            for cmd in re.split('[\r\n]+',sys.stdin.read()):
                command = cmd.strip()
                if command:
                    options['command'] = command
                    epp_doc, str_error = main(options)
                    display(epp_doc, str_error)
        elif len(sys.argv) > 1:
            command = ' '.join(option_args)
            if options['range']:
                epp_doc = str_error = ''
                m = re.match('([^\[]+)\[(\d+)(?:\s*,\s*(\d+))?\]',options['range'])
                if m:
                    min = 0
                    anchor = m.group(1)
                    if m.group(3) is None:
                        max = int(m.group(2))
                    else:
                        min = int(m.group(2))
                        max = int(m.group(3))
                    for n in range(min,max):
                        options['command'] = re.sub(anchor,'%s%d'%(anchor,n),command)
                        epp_doc, str_error = main(options)
                        display(epp_doc, str_error)
                else:
                    print "<?xml encoding='utf-8'?><errors>Invalid range pattern: %s</errors>"%options['range']
            else:
                options['command'] = command
                epp_doc, str_error = main(options)
                display(epp_doc, str_error)
        else:
            print '%s: %s command params\n\n%s\n\n%s%s\n%s\n\n  %s\n'%(_T('Usage'), 'fred_create.py',
                _T('Create EPP XML document from command line parameters.'),
                _T('EXAMPLES'),
                """
./fred_create.py info_domain nic.cz
./fred_create.py info_contact reg-id
echo -en "check_domain nic.cz\\ninfo_domain nic.cz" | ./fred_create.py
cat file-with-commands.txt | ./fred_create.py
""",
                _T('Eventual errors are return in XML format: <errors>... msg ...</errors>.'),
                _T('For more information, see README.')
                )