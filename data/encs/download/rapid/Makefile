SHELL:=/bin/bash

.PHONY all:
all: rapid.cs-en.cs rapid.cs-en.en

.PHONY: check
check:
	test `cat rapid.cs-en.cs | wc -l` = 452411
	test `cat rapid.cs-en.en | wc -l` = 452411
	echo "File sizes OK" >&2

rapid.cs-en.en: RAPID_2019.cs-en.xlf.gz
	zcat $< | grep '^<target' | sed 's/^<target[^>]*>//;s/<[^>]*>$$//' > $@

rapid.cs-en.cs: RAPID_2019.cs-en.xlf.gz
	zcat $< | grep '^<source' | sed 's/^<source[^>]*>//;s/<[^>]*>$$//' > $@

RAPID_2019.cs-en.xlf.gz:
	wget "http://data.statmt.org/wmt20/translation-task/rapid/RAPID_2019.cs-en.xlf.gz"

.SECONDARY:
