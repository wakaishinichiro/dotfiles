#!/bin/bash

mkdir -p ~/.vim/bundle/vimproc.vim
if [ -d "~/.vim/bundle/vimproc.vim/lib/vimproc_mac.so" ]; then
  cd ~/.vim/bundle/vimproc.vim
  make
fi

