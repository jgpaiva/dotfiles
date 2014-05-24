" must do
set nocompatible

set term=xterm-256color "apparently this is not needed
colorscheme badwolf
" from wget https://raw.github.com/sjl/badwolf/master/colors/badwolf.vim -O ~/.vim/colors/badwolf.vim

" set PWD to file's folder
if filereadable("%:p:h")
	cd %:p:h
endif


" general options
set hidden " allow switching buffer without saving
set virtualedit=all " allow the cursor to go outside the text
set backspace=2 " allow backspacing over autoindent, line breaks and start of insert
set autoread " read file again if was changed
set viminfo=s1,<1024000,'1024000,/1024000,:1024000,@1024000,f1,% " save lots of lines
set history=1000
set diffopt+=iwhite " vimdiff ignore white space
set formatoptions-=t "do not enter \n automatically at 80 chars

autocmd BufRead,BufEnter *.*,*  set formatprg=par\|sed\ 's/[[:space:]]*$//' "format everything else using par
autocmd BufRead,BufEnter *.py set formatprg=autopep8\ - "format python using autopep8"

" search
set hlsearch " set highlight search
set ignorecase smartcase " make "hi" match "HI" but "HI" only match "HI"
set incsearch " incremental search
set gdefault " make g default option when searching

" command line
set showcmd " show (partial) command in the last line of the screen
set ruler " set ruler (bottom of the screen, info on file position)
set laststatus=2 " show last statusbar
set shortmess=atI " shortens messages
set infercase " match commands without regard for capitalization
set wildmenu " completion on command line
set wildmode=longest,list,full " complete options with tab

" looks-related stuff
set fillchars=vert:\ ,fold:- " fill chars for splits
set guioptions=r " right hand scroll bar always present
set nofoldenable " Say no to code folding...
set number " show line number
set numberwidth=1 " don't waste space next to numbers
set splitright " splitting a window will put the new window right of the current one
set showmatch " show matching bracket
"some stuff to get the mouse going in term
set mouse=a
"set ttymouse=xterm2

" text width
set colorcolumn=80 " show column at 80 characters
highlight ColorColumn ctermbg=244 " color for column at 80 char
set wrap " set line wrap
set showbreak=+\ " characters to use when breaking line
" setlocal textwidth=78

" encoding
set fileencoding=utf-8
set encoding=utf-8
let &termencoding = &encoding

" indenting
set smarttab
set expandtab " expand tabs to spaces
set autoindent " always set autoindenting on
set smartindent
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set softtabstop=4
set shiftwidth=4

" set whichwrap=h,l,~,[,]

" backup
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


" for pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle && wget https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim -O ~/.vim/autoload/pathogen.vim
"
execute pathogen#infect()
call pathogen#helptags()
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
let g:pymode_syntax = 0
let python_highlight_all = 1
let g:pymode_lint_checkers = ['pyflakes', 'mccabe'] " disable pep8 annoyances
let g:pymode_rope = 0 " Auto-complete would be nice if it didn't constantly hang


" !git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive.git
" !git clone git://github.com/klen/python-mode.git ~/.vim/bundle/python-mode.git
" !git clone git://github.com/hdima/python-syntax.git ~/.vim/bundle/python-syntax.git
" !git clone git://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe.git && cd ~/.vim/bundle/YouCompleteMe.git && git submodule update --init --recursive && ./install.sh
" !git clone git://github.com/b4winckler/vim-angry.git ~/.vim/bundle/vim-angry.git
" !git clone https://github.com/bling/vim-airline.git ~/.vim/bundle/vim-airline.git
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:tex_flavor='latex'
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'tex' : 1,
      \}

" *************************************************************************
" ************************         Mappings       *************************
" *************************************************************************
"leader commands
let mapleader = "§"
" compile anything
nnoremap <Leader>m :w<CR>:make<CR>
" change vim's working directory to file's directory
nnoremap <Leader>cd :cd%:h<CR>
" change buffer's local directory to file's directory
nnoremap <Leader>lcd :lcd%:h<CR>
" delete buffer in window, open next one
nnoremap <Leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
" disable highlighting
nnoremap <Leader>h :nohl<cr>
" format paragraphs with §f
nnoremap <leader>f gqap
" save
nnoremap <leader>s :update
" create table from csv
nnoremap <leader>t :%Table<CR>:set nowrap<CR>

" delete word and create undo
inoremap <C-W> <C-G>u<C-W>
" delete character and create undo
inoremap <bs> <C-G>u<bs>
" move down without changing cursor
inoremap <C-J> <C-X><C-E>
" move up without changing cursor
inoremap <C-K> <C-X><C-Y>
" move down without moving cursor
nnoremap <C-J> <C-E>
" move up without moving cursor
nnoremap <C-K> <C-Y>
" Let's be reasonable, shall we? (arrow keys work as usual)
nnoremap k gk
nnoremap j gj
" Emacs-like beginning and end of line.
inoremap <C-E> <C-O>$
inoremap <C-A> <C-O>^
nnoremap <C-E> $
nnoremap <C-A> ^
" save with s
nnoremap s :update
" open with enter
nnoremap <CR> o
" insert space with space
nnoremap <SPACE> a<SPACE>
" delete with backspace
nnoremap <BS> i<BS>
" switch between buffers
nnoremap <C-N> :bnext<cr>
nnoremap <C-P> :bprevious<cr>
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprevious<cr>
" reload buffer
nnoremap ç :e<CR>G
nnoremap Ç :e!<CR>G
" Disable K looking stuff up
map K <Nop>
" Disable a frequent mistype
map '0 <Nop>
" indentation
vnoremap < <gv " indentation without losing selection
vnoremap > >gv " indentation without losing selection
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" why doesn't the command line work as it should?
cnoremap <C-A> <Home>

nmap q: :q

" *************************************************************************
" ************************        Functions      **************************
" *************************************************************************
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if !exists("function MyDiff")
    set diffexpr=
    function! MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)
