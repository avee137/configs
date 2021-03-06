" ---------------------------------------------------------------------------- "
" $Id: vimrc,v 1.2 2000/02/29 09:36:23 ron Exp witch $
" ---------------------------------------------------------------------------- "
syntax on				" syntax highlighting
"colorscheme monokai
"set dir=>/var/tmp/vi.recover		" dir for swapfiles
"set nowrap
set wrap
set ruler				" see statusline
set tabstop=8
set showmode
set showcmd
set splitbelow				" new window at bottom
set noerrorbells
"set nu
set vb t_vb=				" shut up
set laststatus=2
set ignorecase
set shortmess=atI
set showmatch				" No thanks!
set backspace=2
set nocompatible
set comments=b:#,:%,fb:-,n:>,n:)
set magic
set shell=/bin/bash
"set number				" numbering lines
"set showbreak=\ \ \ \ \ \ \ \
set autoindent
set shiftwidth=8
set sidescroll=1
set smartindent
set cindent
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,ps,ts,c1,+s,(2s,us,)20,*30,gs,hs
set smarttab
set viminfo=%,'50,\"1000,:100,/50,n~/.viminfo
set errorformat=%f:%l:%c:%t:%m
set autowrite
set makeef=/tmp/vim.err
set history=250
set helpheight=16
set tags=./tags,tags
set nobackup				" no backup files
"set writebackup
set backupdir=.,/var/tmp/vi.backup,~/,/tmp
"set patchmode=.orig
"set wildmenu
set ttyfast
set swapsync=fsync
set suffixes=.o,.bak,.BAK,.orig
set verbose=0
set undolevels=8192
"set filetype=on
set bg=dark
set incsearch
set hlsearch
set path=$PWD/**
set cscopetag
set csto=1
set nocscopeverbose
"cs add cscope.out

    if filereadable("cscope.out")
        cs add cscope.out  
    endif
"CSCOPE maps
"
if has("autocmd")
  autocmd FileType python set complete+=kC:/path/to/pydiction iskeyword+=.,(
endif " has("autocmd")


" Copy and paste the word under cursor
map <silent> <C-Space> :<C-R><C-W>

 " Use the C-Space word as the search criterion
 map <silent> <F5>   :cs add cscope.out<CR><CR>
 map os :cs find s <C-R><C-W><CR>
 map oc :cs find c <C-R><C-W><CR>
 map og :cs find g <C-R><C-W><CR>
 map od :cs find d <C-R><C-W><CR>
 map oe :cs find e <C-R><C-W><CR>
 map of :cs find f <C-R><C-W><CR>
 map oi :cs find i <C-R><C-W><CR>
 map ot :cs find t <C-R><C-W><CR>

    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>      

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>



au FileType make setlocal noexpandtab

"for the ShowFunc.vim plugin.
let g:showfuncctagsbin = "/home/ajoseph/software/exu_ctags/ctags-5.6/postinstall/bin/ctags"
let g:ShowFuncScanType = "current"

"for the ctags.vim plugin.
let g:ctags_path= "/home/ajoseph/software/exu_ctags/ctags-5.6/postinstall/bin/ctags"
let g:ctags_statusline=1 
let g:ctags_title=0
let generate_tags=1
	

"autocmd BufNewFile,BufRead *.c,*.h	call FT_c()

" Filename
hi User1 ctermfg=black       ctermbg=gray
" Modified Flag
hi User2 ctermfg=darkred     ctermbg=gray
" ReadOnly Flag
hi User3 ctermfg=darkred     ctermbg=gray
" MODE
hi User4 ctermfg=black       ctermbg=gray
" Lineno
hi User5 ctermfg=black       ctermbg=gray
" Percent
hi User6 ctermfg=black       ctermbg=gray
" UNUSED
hi User7 ctermfg=darkgreen   ctermbg=gray
" Character
hi User8 ctermfg=black       ctermbg=gray
" Background
hi User9 ctermfg=black       ctermbg=gray
hi LineNr ctermfg=darkYellow ctermbg=black
set statusline=%<%1*%-16.20f%2*%m%3*%r%9*%=%-3(%8*%.3b%)\ 0x%-3.3B%5*%6.6l,%-4.4c%-6.12o%06(%6*%-p%%%)

""""""""""""""""""""
" Using vim within pine
au BufNewFile,BufRead	/var/tmp/pico.*	set textwidth=72 nowritebackup nobackup formatoptions+=tcq
"au BufNewFile,BufRead * WMToggle


"""""""""""""""""
" Colors
"
" red=1, green=2, yellow=3, blue=4, magenta=5, cyan=6, white=7 

"highlight Comment term=bold ctermfg=3 ctermbg=0
highlight cComment term=bold ctermfg=6 ctermbg=0
iab _C /*     	*/
iab _U unsigned hyper
" Function Key Mappings
"unmap <F1>
imap <C-Z> <Esc>:u<cr><Esc>i

"map <F1>	:<C-M>
"map <F2>	:w<C-M>
"map <F3>	:u<C-M>
"map <F4>	:redo<C-M>
"map <F5>	:set nowrap<C-M>
"map <F6>	:set wrap<C-M>
"map <F7>	:cq<C-M>
"map <F8>	:w!<C-M>
"map <F9>	:q<C-M>
"map <F10>	:q!<C-M>
"map <F11>	:wq<C-M>
"map <F12>	:wq!<C-M>

"map @r 0O....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8

" Delete All Spaces
map DS	:%s/[ <Tab>]//g<C-M>
" Delete Empty Lines
map DR	:g/^$/d<C-M>
" Delete Empty Lines + Lines w/whitespace only
map DE	:g/^[<C-I> ]*$/d<C-M>
" Change Lines w/WhiteSpace only to \n
map DW	:%s/^[<C-I> ]*$//g<C-M>
" Insert current time
map DT	o<C-R>=strftime("%a %b %d %T %Z %Y")<C-M><C-M>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" C Programming - FileType *.c/*.h
"
function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
           return "\<tab>"
      else
           return "\<c-p>"
      endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

function FT_c()
	" (C)
	map ID	o/** Copyright (C) 2000 by Ron Scott <ron@HostUniverse.net>* All rights reserved.** $Id$*/7k$i<ESC>dd:7<C-M>
	" surround line with /* */
	map CS	I/*A*/
	" C start
	map ST	o/** $Id$*/#include <stdio.h>#include <stdlib.h>#include <unistd.h>int main(int argc, char **argv){return 0;}4k$i
	" simple main()
	map MN	oint main(int argc, char **argv){<Tab>return 0;}3k$i
	" for loop
	map FR	ofor (i = 0; i < x; i++) {}O
	" while loop
	map WH	owhile () {}O
	" do/while loop
	map DW	odo {} while ();O
	" switch
	map SW	oswitch () {}Ocase 0:break;default:break;2k$i
	" getopt
	map GO	owhile ((ch = getopt(argc, argv, "hv")) != -1) {switch (ch) {case 'v':break;case '?':case 'h':break;default:break;}}argc -= optind;argv += optind;11k$i
	" fprintf
	map FF	ofprintf(stdout, "\n");
	map FE	ofprintf(stderr, "\n");
	" malloc/calloc
	map MA	oif ((buf = malloc()) == NULL) {perror("malloc");exit(1);}
	map CA	oif ((buf = calloc(,sizeof())) == NULL) {perror("calloc");exit(1);}
	" open/fopen/popen
	map FD	oif ((fd = open(filename, O_WRONLY\|O_CREAT\|O_TRUNC)) == -1) {perror("open");exit(1);}4k$i
	map FP	oif ((fp = fopen(filename, "r")) == NULL) {perror("fopen");exit(1);}4k$i
	map PP	oif ((pp = popen(progname, "r")) == NULL) {perror("popen");exit(1);}4k$i
	"	C beautify the file...
	map <C-i>	:%!indent -nv<C-M>
	"	...or indent it
	"map IND	:!indent %
	"
	"map <C-w>	:cp<C-M>
	"map <C-e>	:cn<C-M>
	map <C-a>	:cp
	map <C-e>	:cn
	" CTAGS
	map <C-t>	:!(cd %:p:h;/usr/local/bin/ctags *.[ch])&
	" Insert closing brackets
	":inoremap { {<C-M>}<ESC>i
	""""""""""""""""""""""""""""""""""""""""""""""
	" HTML SPECIFIC
	map TT	o(void) fprintf(stdout, "<TABLE WIDTH=\"100%%\">\n");
	map TD	o(void) fprintf(stdout, " <TR>\n");<C-M>(void) fprintf(stdout, "   <TD></TD>\n");<C-M>(void) fprintf(stdout, " </TR>\n");
	map FR	o(void) fprintf(stdout, "<FORM NAME=\"\" METHOD=\"\" ACTION=\"\">\n");
	map IR	o<INPUT TYPE=\"radio\" NAME=\"\" VALUE=\"\">
	map IT	o<INPUT TYPE=\"text\" NAME=\"\" SIZE=\"\" MAXLENGTH=\"\">
	map IS	o<SELECT NAME=\"\"></SELECT>
	map IX	o<TEXTAREA NAME=\"\" COLS=\"\" ROWS=\"\"></TEXTAREA>
	" COPYRIGHT
	map CP	:r /etc/COPYRIGHT:0dd
endfunction

function Compile()
 !g++ -g -O0 % -o %.out
endfunction

nmap <F5> :call Compile()<cr>



" Makefile
map OF	o-O2 -mcpu=k6 -march=k6 -pipe -fexpensive-optimizations
map WF	o-W -Wall -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wconversion -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -Wundef -Wbad-function-cast -Waggregate-return
map CF	o-O2 -mcpu=k6 -march=k6 -pipe -fexpensive-optimizations -W -Wall -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wconversion -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline
map DF	o-D_POSIX_SOURCE -D_XOPEN_SOURCE
"map XX	o-Wenum-clash -Woverloaded-virtual

" Yep, and finally
set secure

"distalgo extensions, syntax=python
au BufNewFile,BufRead,BufReadPost *.da set syntax=python
au BufNewFile,BufRead,BufReadPost *.py.bkp set syntax=python
au! FileType python setl nosmartindent

"
" EOF
"

" sample quickfix script for bsd make - needs ccfilter (www.FreshMeat.net ??)

"#!/bin/ksh
"# ---------------------------------------------------------------------------- #
"# $Id: mk,v 1.3 1999/11/19 16:46:57 witch Exp witch $
"# ---------------------------------------------------------------------------- #
"
"ERRORFILE=""		# if empty, defaults to ./errors.err
"CCFARGS=""		# other aruments to ccfilter
"
"# ---------------------------------------------------------------------------- #
"
"#ulimit -c 0
"
"ARGS="$@"
"
"# ---------------------------------------------------------------------------- #
"
"if [[ -z ${ERRORFILE} ]]; then
"	EFILE="errors.err"
"else
"	CCFARGS="${CFARGS} -f ${ERRORFILE}"
"	EFILE=${ERRORFILE}
"fi
"
"# ---------------------------------------------------------------------------- #
"
"function cleanup
"{
"#	[[ -z ${WRKSRC} ]] || unset WRKSRC
"	[[ -f ${EFILE} ]] && rm -f ${EFILE} > /dev/null 2>&1
"}
"
"trap "cleanup; exit 2" 1 2 15
"
"#export WRKSRC=$(make -V WRKSRC)
"
"function compile
"{
"	make ${ARGS} 2>&1 | tee $(tty) | ccfilter ${CCFARGS}
"	[[ -s ${EFILE} ]] && return 1
"	return 0
"}
"
"function editfile
"{
"	echo ""
"	read JUNK
"	vim -q ${EFILE} && return 1
"	return 0
"}
"
"until compile ; do
"	editfile && break
"done
"
"cleanup
"
"exit 0
"
"# ---------------------------------------------------------------------------- #
"#
"# EOF
"#
