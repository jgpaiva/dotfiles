" must do
set nocompatible

" from wget https://raw.github.com/sjl/badwolf/master/colors/badwolf.vim -O ~/.vim/colors/badwolf.vim
"
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-fugitive.git'
Plugin 'klen/python-mode.git'
Plugin 'hdima/python-syntax.git'
Plugin 'b4winckler/vim-angry.git'
Plugin 'bling/vim-airline.git'
Plugin 'tpope/vim-markdown.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'janko-m/vim-test.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'
Plugin 'tmhedberg/matchit'
Plugin 'kana/vim-textobj-user.git'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'pangloss/vim-javascript.git'
Plugin 'jelera/vim-javascript-syntax.git'
Plugin 'mxw/vim-jsx.git'
Plugin 'bitc/vim-bad-whitespace.git'
Plugin 'wesQ3/vim-windowswap'
Plugin 'AndrewRadev/splitjoin.vim.git'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-cucumber.git'
Plugin 'udalov/kotlin-vim.git'
Plugin 'junegunn/rainbow_parentheses.vim'
call vundle#end()
filetype plugin indent on " Enable filetype-specific indenting and plugins

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
set complete-=i "keep vim from finding completions in included files, which can be slow
set nostartofline "Don't reset cursor to start of line when moving around

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
set shortmess+=A
set infercase " match commands without regard for capitalization
set wildmenu " completion on command line
set wildmode=longest,list,full " complete options with tab

" looks-related stuff
set fillchars=vert:\ ,fold:- " fill chars for splits
set guioptions= " right hand scroll bar always present
set nofoldenable " Say no to code folding...
"http://jeffkreeftmeijer.com/2013/vims-new-hybrid-line-number-mode/
set relativenumber
set number " show line number
set numberwidth=1 " don't waste space next to numbers
set splitright " splitting a window will put the new window right of the current one
set showmatch " show matching bracket
set list " Show white spaces
set listchars=tab:→\ ,trail:·,eol:¬,nbsp:+ " Characters to replace white spaces
"some stuff to get the mouse going in term
set mouse=a
"set ttymouse=xterm2
set scrolloff=1 " always show at least 1 line above and below the cursor
set sidescrolloff=1 " always show at least 5 columns to the left and right of cursor
set display+=lastline " don't replace long lines with @@@

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
set softtabstop=2
set shiftwidth=2

" set whichwrap=h,l,~,[,]

" backup
if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backup " keep a backup file
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


syntax on                 " Enable syntax highlighting
let g:pymode_syntax = 0
let python_highlight_all = 1
let g:pymode_lint_checkers = ['pyflakes', 'mccabe'] " disable pep8 annoyances
let g:pymode_rope = 0 " Auto-complete would be nice if it didn't constantly hang
set background=dark
colorscheme Tomorrow-Night-Eighties
set guifont=Source\ Code\ Pro:h13

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#displayed_head_limit = 15
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_section_x  = ''
let g:airline_section_y  = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'V-L',
      \ 'c'  : 'C',
      \ '' : 'V-B',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
let g:tex_flavor='latex'
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'tex' : 1,
      \}


" ctrlp options
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git', '.hg', 'Rakefile']
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))|(node_modules|vendor|coverage|target)$'
" use silver searcher
" http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ag_highlight=1

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -i --nocolor -g "" --ignore .git'
endif

" *************************************************************************
" ************************         Mappings       *************************
" *************************************************************************
"leader commands
let mapleader = "§"
" compile anything
" nnoremap <Leader>m :w<CR>:make<CR>
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
" start ag!
nnoremap <leader>a :Ag! 
nnoremap <leader>k :Ag! <C-R><C-W><CR>
" <M-N> to to go next quickfix item
noremap ¬ :cn<CR>
" <M-P> to to go previous quickfix item
noremap π :cp<CR>

" <M-H> to go to left window
noremap ˇ <C-W>h
" <M-J> to go to left window
noremap ¯ <C-W>j
" <M-K> to go to left window
noremap „ <C-W>k
" <M-L> to go to left window
noremap ‘ <C-W>l

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
" nnoremap <CR> o
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
" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" why doesn't the command line work as it should?
cnoremap <C-A> <Home>
nnoremap <C-G> :CtrlPLine %<cr>
nnoremap <C-H> :CtrlPLine<cr>
let g:ctrlp_map = '<c-f>'

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

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" enable rainbow parentheses
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" fix terminal vim slow syntax for ruby
 augroup ft_rb
    au!
    " fix the SLOOOW syntax highlighting
    au FileType ruby setlocal re=1 foldmethod=manual
augroup END
