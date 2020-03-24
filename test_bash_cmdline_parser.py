import re
from unittest import TestCase

import bash_cmdline_parser

subject = '[  1% 1/96] /bin/bash -c "out/host/linux-x86/bin/aapt2 compile -o out/target/common/obj/JAVA_LIBRARIES/tv-common_intermediates/flat-res/res/packages/apps/TV/common/res/ --pseudo-localize --legacy packages/apps/TV/common/res/values-az-rAZ/strings.xml"'
subject1 = '[ 93% 90/96] /bin/bash -c "(mkdir -p out/target/common/obj/JAVA_LIBRARIES/tv-common_intermediates/ && rm -f out/target/common/obj/JAVA_LIBRARIES/tv-common_intermediates/link_type ) && (build/make/tools/check_link_type.py --makefile packages/apps/TV/common/Android.mk --module tv-common --type \"java:system\" --allowed java:sdk --allowed java:system --allowed java:core --allowed aapt2_only  out/target/common/obj/JAVA_LIBRARIES/android-support-annotations_intermediates/link_type     out/target/common/obj/JAVA_LIBRARIES/android-support-compat_intermediates/link_type     out/target/common/obj/JAVA_LIBRARIES/android-support-core-ui_intermediates/link_type     out/target/common/obj/JAVA_LIBRARIES/android-support-v17-leanback_intermediates/link_type     out/target/common/obj/JAVA_LIBRARIES/android-support-v7-recyclerview_intermediates/link_type ) && (echo \"java:system\" >out/target/common/obj/JAVA_LIBRARIES/tv-common_intermediates/link_type )"'
subject2 = '[100% 96/96] /bin/bash -c "(rm -f out/target/product/letv_gae/obj/JAVA_LIBRARIES/tv-common_intermediates/javalib.jar ) && (cp \"out/target/common/obj/JAVA_LIBRARIES/tv-common_intermediates/classes.jar\" \"out/target/product/letv_gae/obj/JAVA_LIBRARIES/tv-common_intermediates/javalib.jar\" )"'


class Test(TestCase):
    def test_parse(self):
        # bash_cmdline_parser.format_line(subject)
        # bash_cmdline_parser.format_line(subject1)
        text = bash_cmdline_parser.format_line(subject2)
        print text
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
