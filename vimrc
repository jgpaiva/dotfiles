set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source ~/.vim/python_vimrc.txt
"source $VIMRUNTIME/mswin.vim

set diffexpr=
function MyDiff()
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


"added by jgpaiva

colorscheme asmanian2

set cmdheight=2
set hlsearch
set ignorecase smartcase
set incsearch
set infercase
set expandtab 
set softtabstop=4
set shiftwidth=4
"set smartindent
"set paste
set wrap
set ruler
set foldcolumn=1
set foldenable " Turn on folding
set foldmethod=indent " Make folding indent sensitive
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set backspace=2
set virtualedit=all
set laststatus=2
imap <C-BS> vboldi
set number
set showmatch
set gdefault
set showcmd
set whichwrap=h,l,~,[,]
set fillchars=vert:\ ,fold:-
set hidden " you can change buffer without saving
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
set showbreak=+\
set viminfo=s1,<1024000,'1024000,/1024000,:1024000,@1024000,f1,%
set splitright
setlocal textwidth=78
set guioptions=r
set wildmode=longest,list,full
set diffopt+=iwhite "vimdiff ignore white space


"imap
imap  :updatei<Right>
imap <F9> :update:make clean:make
imap <C-BS> vboldi
"vmap
vmap <tab> >gv
vmap <s-tab> <gv
vmap  :updategv
"nmap
nmap  o
nmap <F9> :update:make clean:make
nmap  :update
nmap <Space> <PageDown>
nmap <BS> <PageUp>
nmap  :bnext
nmap  :bprevious
nmap -cd :cd%:h<CR>
nmap -lcd :lcd%:h<CR>
nmap <c-f4> :bdel<cr>
nmap î :cnext<CR>
nmap ð :cprev<CR>
nmap <c-tab> gqap
nmap <c-s-tab> :tabprev<CR>
nmap <C-J> gj
nmap <C-K> gk
nmap <C-L> <C-F>
nmap <C-H> <C-B>
nmap <bs> i<bs>
nmap <space> a<space>
nmap \ @@
nmap ç :e!<CR>G
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>
nmap _ -lcd:!cp % aa.tex:!pdflatex aa.tex:!bibtex aa:!pdflatex aa.tex:!pdflatex aa.tex:!pdflatex aa.tex



let g:miniBufExplMapCTabSwitchWindows = 1
let g:miniBufExplUseSingleClick = 1

set fileencoding=utf-8
set encoding=utf-8
let &termencoding = &encoding
cd %:p:h

" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction

nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

command Date :r !date +"\%y\%m\%d"
