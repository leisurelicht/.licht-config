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

function! custom#header#Raml() abort
  call setline(1, '#%RAML 1.0')
  call setline(2, '---')
  call setline(3, 'title: ')
  call setline(4, 'baseUri: ')
  call setline(5, 'version: ')
  normal! gg
  normal! j
  normal! j
  normal! $
  normal! a
endfunction
