#!/usr/bin/env sh

function pHeader()     { echo -e "\033[1m$@\033[0m";  }
function pStep()       { echo -e "  \033[1;33m➜\033[0m $@"; }
function pFinishStep() { echo -e "  \033[1;32m✔\033[0m $@"; }
function pGood()       { echo -e "    \033[1;32m✔\033[0m $@"; }
function pBad()        { echo -e "    \033[1;31m✖\033[0m $@"; }
function pWarning()    { echo -e "    \033[1;33m⚠︎\033[0m $@"; }

function pTest() {
    pHeader Header
    pStep Step
    pFinishStep Finish Step
    pGood Good
    pWarning Warning
    pBad Bad
}