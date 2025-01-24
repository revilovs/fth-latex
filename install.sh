#!/bin/bash
TEXMFHOME=`kpsewhich -var-value TEXMFHOME`
TARGETDIR=$TEXMFHOME/tex/latex/fth
mkdir -p $TARGETDIR
cp fth/beamerthemeGiessen.sty fth/fth-bib.sty fth/fth-lsa.sty fth/fth-lang.sty fth/fth-nt-utils.sty $TARGETDIR
