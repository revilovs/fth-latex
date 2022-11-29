#!/bin/bash
TEXMFHOME=`kpsewhich -var-value TEXMFHOME`
mkdir -p $TEXMFHOME/tex/latex/fth
cp fth/fth-lsa.sty $TEXMFHOME/tex/latex/ecdd
