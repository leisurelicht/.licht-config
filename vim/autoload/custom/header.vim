function! custom#header#Python() abort
  call setline(1, '#!/usr/bin/env python')
  call setline(2, '# -*-coding: utf-8-*-')
  normal! G
  normal! o
  normal! o
endfunction

function! custom#header#Bash() abort
  call setline(1, '#!/bin/bash')
  normal! G
  normal! o
  normal! o
endfunction
