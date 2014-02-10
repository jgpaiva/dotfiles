#!/usr/bin/env bash

set -o errexit
set -o errtrace
set -o nounset

DIR=`dirname $1`

pushd $DIR

filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

echo $1
pwd

cp $1 .tmp.tex
pdflatex -file-line-error -interaction=nonstopmode .tmp.tex
bibtex .tmp
pdflatex -file-line-error -interaction=nonstopmode .tmp.tex
pdflatex -file-line-error -interaction=nonstopmode .tmp.tex
mv .tmp.pdf $filename.pdf
rm .tmp.*
