#!/bin/sh

emacs --batch -Q --eval "(progn (org-mode) (org-babel-tangle-file \"README.org\"))"

EMACS_DIR="$HOME/.emacs.d"

if [[ $(pwd) -ef $EMACS_DIR ]];
then
  exit 0
fi

mv init.el $EMACS_DIR 
mv early-init.el $EMACS_DIR
