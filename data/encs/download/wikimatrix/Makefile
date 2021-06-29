SHELL:=/bin/bash

.PHONY all:
all: wikimatrix.cs-en.cs wikimatrix.cs-en.en

.PHONY: check
check:
	test `cat wikimatrix.cs-en.cs | wc -l` = 315362
	test `cat wikimatrix.cs-en.en | wc -l` = 315362
	echo "File sizes OK" >&2

wikimatrix.cs-en.cs: WikiMatrix.v1.cs-en.langid.tsv.gz
	zcat $< | awk '{if($$1>1.05)print}' | grep -P 'cs\ten$$' | tee >(cut -f2 > wikimatrix.cs-en.cs) >(cut -f3 > wikimatrix.cs-en.en) >/dev/null

wikimatrix.cs-en.en: wikimatrix.cs-en.cs
	$(NOOP)

WikiMatrix.v1.cs-en.langid.tsv.gz:
	wget "http://data.statmt.org/wmt20/translation-task/WikiMatrix/WikiMatrix.v1.cs-en.langid.tsv.gz"

.SECONDARY:
