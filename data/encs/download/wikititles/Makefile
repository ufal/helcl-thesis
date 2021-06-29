SHELL:=/bin/bash

.PHONY: all
all: wikititles.cs-en.cs wikititles.cs-en.en

.PHONY: check
check:
	test `cat wikititles.cs-en.cs | wc -l` = 382337
	test `cat wikititles.cs-en.en | wc -l` = 382337
	echo "File sizes OK" >&2

wikititles.cs-en.cs: wikititles-v2.cs-en.tsv.gz
	zcat $< | tee >(cut -f1 > wikititles.cs-en.cs) >(cut -f2 > wikititles.cs-en.en) >/dev/null

wikititles.cs-en.en: wikititles.cs-en.cs
	$(NOOP)


wikititles-v2.cs-en.tsv.gz:
	wget "http://data.statmt.org/wikititles/v2/wikititles-v2.cs-en.tsv.gz"

.SECONDARY:
