#!/bin/bash

echo "$0" "$*" >> /dev/stderr

prefix=${1%.*}-
time Rscript -e "library(knitr)"\
 -e "opts_knit\$set(base.url='http://animation.r-forge.r-project.org/knitr-ex/')"\
 -e "opts_chunk\$set(cache.path='cache/$prefix', fig.path='figure/$prefix', tidy=TRUE)"\
 -e "set.seed(123); knit('$1', quiet = TRUE)"

# if there is an extra argument, compile tex to pdf
if [ "$2" != '' ]; then
  texi2pdf -c ${1%.*}.tex
fi
