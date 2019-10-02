#!/bin/bash

if [[ ! -d "~/.fonts" ]]; then
  mkdir ~/.fonts
fi

cp -r ../fonts/* ~/.fonts
