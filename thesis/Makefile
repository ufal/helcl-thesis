LATEX=lualatex

SHELL := /bin/bash
SVG_FILES := $(wildcard img/*.svg)
TABLES := $(wildcard tables/*.tex)
CHAPTERS := $(wildcard 0?-*.tex)
PNG_FILES := $(wildcard img/*.png)
GNUPLOT_FILES := $(wildcard plots/*.gnu)
TIKZ_IMAGES := $(wildcard img/*.tex)

all: thesis.pdf  #camera_abstract_en.pdf camera_abstract_cs.pdf autoreferat/autoreferat.pdf

.PHONY: all clean


watch: thesis.pdf
		latexmk -r latexmkrc -pdflatex="$(LATEX) %O %S" -pdf -dvi- -ps- -interaction=nonstopmode -synctex=1 -pvc thesis

thesis.pdf: thesis.tex references.bib *.tex $(PNG_FILES) $(GNUPLOT_FILES:%.gnu=%.tex) $(TABLES) $(CHAPTERS) $(TIKZ_IMAGES)
# TODO additional prereqs: plots/pos_encoding.pgf plots/distance_correlation_selected.pgf img/beamsearch.tex plots/imagenet.tex
		latexmk -r latexmkrc -pdflatex="$(LATEX) %O %S" -pdf -dvi- -ps- thesis
		makeglossaries thesis
		latexmk -r latexmkrc -pdflatex="$(LATEX) %O %S" -pdf -dvi- -ps- thesis

clean:
		rm -f thesis.{aux,acn,acr,bbl,blg,alg,aux,fdb_latexmk,fls,glg,glo,gls,ist,lof,log,lot,out,pdf,toc,xmpdata} ??-*.{aux,fdb_latexmk,log}

normostrany:
		echo `detex ??-*.tex | wc -c` / 1800 | bc -l

%.pdf: %.svg
	inkscape -A $*.pdf $*.svg

%.tex: %.gnu
	gnuplot plots/$(*F)*.gnu

# plots/pos_encoding.pgf: plots/pos_encoding.py plots/matplotlib-env
# 	source plots/matplotlib-env/bin/activate; \
# 	python plots/pos_encoding.py
# 	sed -i 's#pos_encoding#plots/pos_encoding#;s/interpolate=true//' plots/pos_encoding.pgf

# plots/distance_correlation_selected.pgf: plots/distance_correlation_matrix.py plots/matplotlib-env
# 	source plots/matplotlib-env/bin/activate; \
# 	python plots/distance_correlation_matrix.py
# 	sed -i 's#distance_correlation_selected#plots/distance_correlation_selected#;s/interpolate=true//' plots/distance_correlation_selected.pgf

# plots/matplotlib-env:
# 	virtualenv -p python3 plots/matplotlib-env
# 	source plots/matplotlib-env/bin/activate; pip install numpy matplotlib

# img/dot2tex:
# 	virtualenv -p python2 img/dot2tex
# 	source img/dot2tex/bin/activate; pip install dot2tex

# img/beamsearch.tex: img/beamsearch.dot img/dot2tex
# 	source img/dot2tex/bin/activate; dot2tex --preproc img/beamsearch.dot | dot2tex | sed -e 's/<s>/\\tt <s>/' > img/beamsearch.tex

references.bib: references_complete.bib
	grep -vP '^ *(url|doi)' references_complete.bib > references.bib

# plots/imagenet.tex: plots/imagenet.gnu plots/imagenet.dat
# 	gnuplot plots/imagenet.gnu

# stats: stats/stats.pdf

# stats/stats.pdf: stats/stats.tex stats/reference_years.pgf stats/most_cited_authors.tex stats/commit_stats.py
# 	source stats/env/bin/activate; stats/commit_stats.py
# 	cd stats; latexmk -pdflatex="$(LATEX) %O %S" -pdf -dvi- -ps- stats

# stats/reference_years.pgf: references_complete.bib stats/reference_years.py
# 	source stats/env/bin/activate; stats/reference_years.py < references_complete.bib

# stats/most_cited_authors.tex: references_complete.bib
# 	grep author references_complete.bib | sed -e 's/^[^{]*{//;s/},\{0,1\}$$//;s/ and /\n/g' | sort | uniq -c | sort -rn | head -n 30 | sed -e 's/ *\([0-9]*\) \(.*\)$$/\\item \2 (\1)/' > stats/most_cited_authors.tex


# camera_abstract_en.pdf: camera_abstract_en.tex abstract_en.tex
# 		latexmk -r latexmkrc -pdflatex="$(LATEX) %O %S" -pdf -dvi- -ps- camera_abstract_en

# camera_abstract_cs.pdf: camera_abstract_cs.tex abstract_cs.tex
# 		latexmk -r latexmkrc -pdflatex="$(LATEX) %O %S" -pdf -dvi- -ps- camera_abstract_cs

# autoreferat/autoreferat.pdf: autoreferat/autoreferat.tex autoreferat/content.tex autoreferat/autoreftitle.tex $(TABLES) $(TIKZ_IMAGES) references.bib
# 		cp references.bib autoreferat/references.bib
# 		cd autoreferat; latexmk  -pdflatex="$(LATEX) %O %S" -pdf -dvi- -ps- autoreferat

# defense_slides/slides.pdf: defense_slides/slides.tex
# 		cd defense_slides; latexmk  -pdflatex="xelatex %O %S" -pdf -dvi- -ps- slides
