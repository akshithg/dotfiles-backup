#!/usr/bin/env bash

SCRIPTDIR="${0%/*}"
source $SCRIPTDIR/../pretty-print.sh


pHeader "First time setup"
pStep "Detecting OS & ARCH ..."
OS=`uname -s`
ARCH=`uname -m`
pGood "Detected: $OS on $ARCH"

while true; do
    read -p "Continue with setup?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit 0;;
        * ) pBad "Please answer yes or no.";;
    esac
done
pFinishStep "OS detection complete, preceeding to setup..."

pStep "System Setup"
if [ "$OS" == "Darwin" ]; then
    $SCRIPTDIR/mac.sh
elif [ "$OS" == "Linux" ]; then
    $SCRIPTDIR/linux.sh
fi
pFinishStep "Done!"
