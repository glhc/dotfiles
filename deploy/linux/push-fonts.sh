#!/bin/bash

if [ ! -d ~/.local/share/fonts ]
then
  mkdir -p ~/.local/share/fonts
fi

cp -r ../../src/universal/fonts/patched-fonts/. ~/.local/share/fonts
cp -r ../../src/universal/fonts/unpactched-fonts/. ~/.local/share/fonts

# Update the font cache
fc-cache


