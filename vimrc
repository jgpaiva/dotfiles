
" must do
set nocompatible

" set colorscheme
set term=xterm-256color
colorscheme asmanian2

" set PWD to file's folder
cd %:p:h


" general options
set hidden " allow switching buffer without saving
set virtualedit=all " allow the cursor to go outside the text
set backspace=2 " allow backspacing over autoindent, line breaks and start of insert
set autoread " read file again if was changed
set viminfo=s1,<1024000,'1024000,/1024000,:1024000,@1024000,f1,% " save lots of lines
set history=1000
set diffopt+=iwhite " vimdiff ignore white space

" search
set hlsearch " set highlight search
set ignorecase smartcase " make "hi" match "HI" but "HI" only match "HI"
set incsearch " incremental search
set gdefault " make g default option when searching

" command line
set cmdheight=2 " make command window 2 lines high
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
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
set nofoldenable " Say no to code folding...
" Highlight the status line
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

" *************************************************************************
" ************************         Mappings       *************************
" *************************************************************************
"leader commands
let mapleader = "§"
" compile LaTeX
nnoremap <Leader>l :lcd%:h<CR>:!cp % .tmp.tex:!pdflatex .tmp.tex:!bibtex .tmp:!pdflatex .tmp.tex:!pdflatex .tmp.tex:!mv .tmp.pdf %:t:r.pdf:!rm .tmp.*
" change vim's working directory to file's directory
nnoremap <Leader>cd :cd%:h<CR>
" change buffer's local directory to file's directory
nnoremap <Leader>lcd :lcd%:h<CR>
" delete buffer in window, open next one
nnoremap <Leader>d :bdel<cr>v
" disable highlighting
nnoremap <Leader>h :nohl<cr>
" format paragraphs with §f
nnoremap <leader>f gqap
" save
nnoremap <leader>s :update

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

" *************************************************************************
" *********************  Statusline pr0n   ********************************
" *************************************************************************
"statusline setup
set statusline =%#identifier#
set statusline+=[%f]    "tail of the filename
set statusline+=%*

""display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

""read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c%V,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

highlight StatusLine ctermfg=blue ctermbg=yellow

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

