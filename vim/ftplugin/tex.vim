let b:tex_flavor = 'pdflatex'
compiler tex
setlocal makeprg=~/.bin/compileLatex.sh\ %
setlocal errorformat=%f:%l:\ %m
setlocal spell
