#!/bin/bash
TEXMFHOME=`kpsewhich -var-value TEXMFHOME`
TARGETDIR=$TEXMFHOME/tex/latex/fth
mkdir -p $TARGETDIR
cp fth/fth-lsa.sty $TARGETDIR
