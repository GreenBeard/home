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
