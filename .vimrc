" Setting some decent VIM settings for programming

set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
"set cmdheight=2                " make the command 2 lines instead of one
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
syntax on                       " turn syntax highlighting on by default
set number		                	" show lines numbers
set shellslash                  " sets the file path separator to be compatible with unix shell i.e. / not \
set diffopt+=iwhite             " ignore whitespace for diffs
set shellcmdflag=-ic            " Set shell to be interactive. Adds support for using bash aliases in :!
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set t_Co=256                    " Set number of colours to 256
colorscheme desert 
set guifont=DejaVu_Sans_Mono:h12:cARABIC
set encoding=utf-8
let mapleader=","

function! CreateVariableAccessor()
  normal "ayiw
  exec "normal o" . "\<cr>public function get" . @a . "(){"
  normal ==
  exec "normal o" . "return $this->" . @a .";"
  normal ==
  exec "normal o" . "}"
  normal ==

  exec "normal o" . "\<cr>public function set" . @a . "($_" .@a ."){"
  normal ==
  exec "normal o" .  "$this->" . @a ." = $_" .@a .";"
  normal ==
  exec "normal o" . "}"
  normal ==

endfunction
map <leader>t :call CreateVariableAccessor()<cr>

