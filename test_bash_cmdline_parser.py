import re
from unittest import TestCase

import bash_cmdline_parser

subject = '[  1% 1/96] /bin/bash -c "out/host/linux-x86/bin/aapt2 compile -o out/target/common/obj/JAVA_LIBRARIES/tv-common_intermediates/flat-res/res/packages/apps/TV/common/res/ --pseudo-localize --legacy packages/apps/TV/common/res/values-az-rAZ/strings.xml"'

class Test(TestCase):
    def test_parse(self):
        bash_cmdline_parser.parse_line(subject)
        pass
        # self.fail()

    def test_reg_expr(self):
        arg_pattern = r"(\s+\-[\-\w]+)"
        arg_repl = r" \\\n\1"
        res = re.findall(arg_pattern, subject)
        print res

        res, m = re.subn(unicode(arg_pattern), unicode(arg_repl), unicode(subject))
        print "result(%s), '%s'" % (m, res)
        obj = re.compile(unicode(arg_pattern))
        m = obj.search(unicode(subject))
        if m:
            print 'search result'

        pass