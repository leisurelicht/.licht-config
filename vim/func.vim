" 自动添加头信息
function func#AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
	    call setline(1, "\#!/bin/bash")
    endif
    "如果文件类型为.py
    if &filetype == 'python'
	    call setline(1, "\#!/usr/bin/env python")
	    call setline(2, "\# _*_  coding: utf-8 _*_")
    endif
    normal G
    normal o
endfunc
