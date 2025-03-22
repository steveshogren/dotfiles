if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" colorscheme torte


" Syntax highlighting makes reading some text impossible in vimdiff mode.
" Disable syntax highlighting in vimdiff mode:
if &diff
    syntax off
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
  set hlsearch
endif

set bg=dark
set autoindent
set nobackup
set number
set showmatch

set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set display=truncate

set scrolloff=5
    " ^ Number of lines to display above/below when scrolling lines
set sidescroll=4
    " ^ Number of chars to scroll horizontally. Default is half a page.
set sidescrolloff=20
    " ^ Number of chars to display at the left/right edge before scrolling horizontally.

set nrformats-=octal

if has('reltime')
  set incsearch
endif
    " ^ Show search results as you type
set backspace=indent,eol,start
    " ^ Sensible backspace behavior
    "   See here: https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
    "   indent    allow backspacing over autoindent
    "   eol       allow backspacing over line breaks (join lines)
    "   allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert


set encoding=utf-8
    " ^ Display unicode chars. Without this you'd see weird output of degraded chars
    "   For windows gvim this needs to go high up in the config file otherwise you'll
    "   get error messages from gvim during loading if any unicode appears before it.

" The following changes come from making everything tabs->spaces, not only python.
" This effectively replaces the commented python code later on:
set tabstop=4
    " ^ Tab key is now 4 chars rather than the traditional 8 chars which wastes
    "       too much space when indenting.
set expandtab
    " ^ Inserts spaces whenever TAB key is pressed
    "       If you want to insert a real tab char - use:  ctrl-v <TAB_KEY>
set shiftwidth=4
    " ^ Sets the number of space characters inserted for indentation
set softtabstop=4
    " ^ Makes the spaces feel like real tabs

set list
    " ^ list & listchars mostly useful to find leading tabs at the beginning of python code
set listchars=extends:>,precedes:<,nbsp:☠,tab:▸␣
    " ^ The chars are:
    "   extends -   Show the '>' char in long nonwrapped lines at the right
    "   precedes -  Show the '<' char in long nonwrappled lines at the left
    "   nbsp -      Show the special char instead of a non-breakable space
    "   tab -       Shows the special char instead of the tab char


set nowrap
    " ^ We can disable default wrap because I've now got indicators for lines
    "       that are longer than the screen fits.


" The following section defines the line numbering colors.
" Note - the colors defined here work well when viewed inside a 256+ color terminal.
"   If you edit a file directly on the device console you will most likely see degraded colors
"   or even missing/wrong colors. Don't be surprised by this and try to fix vimrc, it's probably
"   the console that can't handle the colors defined herein.
set cursorline
    " ^ Enables cursor line position tracking
highlight clear CursorLine
    " ^ Removes the underline caused by enabling cursorline
highlight CursorLine guibg=#00005f ctermbg=darkblue
    " ^ Current line background color
highlight clear CursorLineNr
    " ^ In new vim versions the cursor line number is separated from CursorLine
    "       and without this the cursor line number will still be underlined.
highlight LineNr guifg=blue
highlight CursorLineNR guibg=red guifg=white
    " ^ Sets the line numbering to a clear background


" Support for yaml format:
autocmd Filetype yaml setlocal
    \ expandtab
    \ tabstop=2
    \ shiftwidth=2
    \ softtabstop=2


" Extra white space tips from here:
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces :
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
    " ^ Any whitespace - even on empty lines
" match ExtraWhitespace /\S\zs\s\+$/
    " ^ Whitespace only after some text
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    " ^ Any whitespace


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " ^ Disable auto insert comment on a new line after a comment in the line above


autocmd FileType text setlocal textwidth=0
    " ^ Override the stupid wrap lines autocmd:

let &guicursor = &guicursor . ",a:blinkon0"

