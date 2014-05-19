#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pyotherside
import sys
import time
import os

from platform import python_version
timet1=time.time()
from sympy import *
from sympy import __version__
from sympy.interactive.printing import init_printing
from sympy.printing.mathml import mathml
timet2=time.time()
loadingtimeLimit = timet2-timet1

versionPython = python_version()
versionSymPy = __version__

nonCalculatedLimit = ""
nonCalculatedLimitOutput = ""
resultLimit = ""
resultLimitSimp = ""
resultOutput = ""
timeLimit = 0.0
limitErrorMessage = "Error: limit not calculated"

def fixUnicodeText(text):
    text = text.replace(u"⎽","_")
    text = text.replace(u"ℯ","e")
    text = text.replace(u"ⅈ","i")
    return text

def calculate_Limit(expression,variable,point,direction):
    global nonCalculatedLimit, nonCalculatedLimitOutput, resultLimit, resultLimitSimp, resultOutput, timeLimit

    init_printing(use_unicode=True, num_columns=30)
    timet1=time.time()

    expressionLimit = expression
    variableLimit = variable.strip()
    pointLimit = point.strip()
    limitExpr = u'('+expressionLimit+u','+variableLimit+u','+pointLimit
    if direction != 'Bilateral':
        limitExpr += u',dir=\"'
        if direction == 'Left':
            limitExpr += u'-\"'
        elif direction == 'Right':
            limitExpr += u'+\"'
    limitExpr += u')'
    if direction == 'Bilateral':
        try:
            nonCalculatedLimit = sympify(u'Limit'+limitExpr)
        except:
            nonCalculatedLimit = u'Limit'+limitExpr
    else:
# "Limit" has a bug not showing the "+" and "-" above the point value.
        nonCalculatedLimit = u'Limit'+limitExpr

    if direction == 'Bilateral':
        try:
            if (sympify(u'limit'+limitExpr)) == (sympify(u'limit'+limitExpr[:-1]+u',dir=\"-\")')):
                resultLimit = sympify(u'limit'+limitExpr)
            else:
                resultLimit = u"Bilateral limit does not exist because the limits from the left and right are different."
        except:
            resultLimit = limitErrorMessage
    else:
        try:
            resultLimit = sympify(u'limit'+limitExpr)
        except:
            resultLimit = limitErrorMessage

    resultLimitSimp = resultLimit

    timet2=time.time()
    timeLimit = timet2-timet1

    nonCalculatedLimitOutput = nonCalculatedLimit
    resultOutput = resultLimitSimp
    if direction == 'Bilateral':
        nonCalculatedLimitOutput = fixUnicodeText(printing.pretty(nonCalculatedLimit))
    if (type(resultLimitSimp) != str):
        resultOutput = fixUnicodeText(printing.pretty(resultLimitSimp))

    if (timeLimit > 0.0):
        result = '<FONT COLOR="LightGreen">'+("Calculated after %f s :" % timeLimit)+'</FONT><br>'
    else:
        result = u""
    if nonCalculatedLimitOutput:
        result += u'<FONT COLOR="LightBlue">'+(nonCalculatedLimitOutput.replace(' ','&nbsp;')).replace("\n","<br>")+'<br>=</FONT><br>'
    if (type(resultLimitSimp) != str):
        result += (resultOutput.replace(' ','&nbsp;')).replace("\n","<br>")
    else:
        result += u'<FONT COLOR="Red">'+((resultOutput.replace(' ','&nbsp;')).replace("\n","<br>"))+'</FONT>'
    return result

