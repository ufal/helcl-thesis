SHELL:=/bin/bash

.PHONY: all
all: news-commentary.cs-en.cs news-commentary.cs-en.en

.PHONY: check
check:
	test `cat news-commentary.cs-en.cs | wc -l` = 255381
	test `cat news-commentary.cs-en.en | wc -l` = 255381
	echo "File sizes OK" >&2

news-commentary.cs-en.cs: news-commentary-v15.cs-en.tsv.gz
	zcat $< | tee >(cut -f1 > news-commentary.cs-en.cs) >(cut -f2 > news-commentary.cs-en.en) >/dev/null

news-commentary.cs-en.en: news-commentary.cs-en.cs
	$(NOOP)

news-commentary-v15.cs-en.tsv.gz:
	wget "http://data.statmt.org/news-commentary/v15/training/news-commentary-v15.cs-en.tsv.gz"

.SECONDARY:
