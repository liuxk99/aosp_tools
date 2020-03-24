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
import re


def reg_replace(subject, pat, repl):
    u_subject = unicode(subject)
    u_pat = unicode(pat)
    u_repl = unicode(repl)
    print "=> replace('%s', \n'%s', \n'%s')" % (u_subject, u_pat, u_repl)

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
