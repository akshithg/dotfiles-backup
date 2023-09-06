#!/usr/bin/env zsh

set -e

# stow - https://ftp.gnu.org/gnu/stow/
STOW=stow-2.3.1
STOW_DIR="$HOME/stow"

if [ ! -d "$STOW_DIR" ]
then
	mkdir -p $STOW_DIR
	wget -c https://ftp.gnu.org/gnu/stow/$STOW.tar.gz -O - | tar -xz -C $STOW_DIR
	cd $STOW_DIR/$STOW
	./configure --prefix=$STOW_DIR
	make install
else
	echo "$STOW_DIR exists. Remove to continue"
fi
