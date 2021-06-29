SHELL:=/bin/bash

.PHONY: all
all: paracrawl.cs-en.cs paracrawl.cs-en.en

.PHONY: check
check:
	test `cat paracrawl.cs-en.cs | wc -l` = 5345693
	test `cat paracrawl.cs-en.en | wc -l` = 5345693
	echo "File sizes OK" >&2

paracrawl.cs-en.cs: paracrawl.en-cs.txt.gz
	zcat $< | tee >(cut -f1 > paracrawl.cs-en.cs) >(cut -f2 > paracrawl.cs-en.en) >/dev/null

paracrawl.cs-en.en: paracrawl.cs-en.cs
	$(NOOP)

paracrawl.en-cs.txt.gz:
	wget -O "$@" "https://s3.amazonaws.com/web-language-models/paracrawl/release5.1/en-cs.txt.gz"

.SECONDARY:
