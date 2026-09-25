#!/bin/sh

set -e

SCRIPT_DIR="$(dirname "$0")";

mkdir -p ~/.emacs.d;
cp "${SCRIPT_DIR}/scripts/.emacs" ~/.emacs.d/coffin;
if ! grep -q "^(load \"~/.emacs.d/coffin\")\$" ~/.emacs; then
  echo "(load \"~/.emacs.d/coffin\")" >> ~/.emacs;
fi

sudo apt-get install -y \
  emacs-nox \
  trashcli \
;

git config --global merge.conflictstyle diff3
git config --global pull.ff only
git config --global user.name "Alexander Coffin"

###
TODO
  acoffin@acoffin-xps-15:~$ cat ~/.xsessionrc
  #!/usr/bin/env sh

  if [ -f /etc/profile ]; then
    . /etc/profile
  fi
  if [ -f ~/.profile ]; then
    . ~/.profile
  fi
###
