SHELL:=/bin/bash

.PHONY: all
all: europarl.cs-en.cs europarl.cs-en.en

.PHONY: check
check:
	test `cat europarl.cs-en.cs | wc -l` = 645330
	test `cat europarl.cs-en.en | wc -l` = 645330
	echo "File sizes OK" >&2

europarl.cs-en.cs: europarl-v10.cs-en.tsv.gz
	zcat $< | tee >(cut -f1 > europarl.cs-en.cs) >(cut -f2 > europarl.cs-en.en) >/dev/null

europarl.cs-en.en: europarl.cs-en.cs
	$(NOOP)

europarl-v10.cs-en.tsv.gz:
	wget "http://www.statmt.org/europarl/v10/training/europarl-v10.cs-en.tsv.gz"

.SECONDARY:
