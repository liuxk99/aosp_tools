#!bin/env/python
# encoding=utf-8
# -------------------------------------------------------------------------------
# Name:        parser
# Purpose:      for result 'showcomamds'
#
# Author:      thomas
#
# Created:     23/03/2020
# Copyright:   (c) thomas 2020
# Licence:     <your licence>
# coding=utf-8
# -------------------------------------------------------------------------------
import codecs
import getopt
import os
import re
import sys


def reg_replace(subject, pat, repl):
    u_subject = unicode(subject)
    u_pat = unicode(pat)
    u_repl = unicode(repl)
    # print "=> replace('%s', \n'%s', \n'%s')" % (u_subject, u_pat, u_repl)

    new_subject = None
    num = 0

    # format
    # [  1% 1/96] /bin/bash -c "out/host/linux-x86/bin/aapt2 compile -o out/target/common/obj/JAVA_LIBRARIES/tv-common_intermediates/flat-res/res/packages/apps/TV/common/res/ --pseudo-localize --legacy packages/apps/TV/common/res/values-az-rAZ/strings.xml"
    #

    obj = re.compile(u_pat)
    # obj.match from first character, search is not
    res = obj.search(u_subject)
    if res:
        new_subject, num = re.subn(obj, u_repl, u_subject)
        return new_subject, num
    return new_subject, num


bash_prefix = "/bin/bash -c"
progress_pat = r"(\[ *[0-9]+% [0-9]+/[0-9]+\] )" + bash_prefix
progress_repl = r"# \1\n" + bash_prefix
arg_pattern = r"(\s+\-[\-\w]+)"
arg_repl = r" \\\n\1"

op_pat = r"(&&|\|\|)"
op_repl = r"\\\n\1"


def format_line(line):
    text = line

    text1, num1 = reg_replace(line, progress_pat, progress_repl)
    if text1:
        text = text1

    text2, num2 = reg_replace(text, op_pat, op_repl)
    if text2:
        text = text2

    text3, num3 = reg_replace(text, arg_pattern, arg_repl)
    if text3:
        text = text3

    return text
    pass


def format_file(log_file, out_file):
    print "format_file('%s', '%s')" % (log_file, out_file)
    if not os.path.isfile(log_file):
        print "log_file('%s') doesn't exist! Try abs path." % log_file
        return

    if not os.path.isfile(log_file):
        print "(out_file)'%s' doesn't exist! Try abs path." % out_file
        return

    out_bash = codecs.open(out_file, 'w', 'utf-8-sig')

    with open(log_file) as in_file:
        for line in in_file:
            m = re.match(progress_pat, line)
            if m:
                new_line = format_line(line)
            else:
                new_line = "# " + line

            out_bash.write(new_line.decode('utf-8'))
        pass

    out_bash.close()
    pass


# if not called as a module
def help(cmd):
    print "%s -i $log_file -o $out_sh" % cmd
    sys.exit(1)

    pass


if __name__ == '__main__':
    # sys.setdefaultencoding('utf8')
    exec_cmd = sys.argv[0]

    if len(sys.argv) < 2:
        help(exec_cmd)

    # parse parameters
    try:
        opts, args = getopt.getopt(sys.argv[1:], "i:o:", ["help"])
    except getopt.GetoptError:
        print("syntax error")
        help(exec_cmd)

    log_file = None
    out_file = None
    # print opts
    # print args
    for cmd, arg in opts:
        if cmd in '-o':
            out_file = arg
        elif cmd in '-i':
            log_file = arg
        elif cmd in '--help':
            help(exec_cmd)

    if log_file is None or out_file is None:
        print("syntax error")
        help(exec_cmd)

    format_file(log_file, out_file)
    pass
