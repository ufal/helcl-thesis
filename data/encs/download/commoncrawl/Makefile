SHELL:=/bin/bash

.PHONY: all
all: commoncrawl.cs-en.cs commoncrawl.cs-en.en

.PHONY: check
check:
	test `cat commoncrawl.cs-en.cs | wc -l` = 161838
	test `cat commoncrawl.cs-en.en | wc -l` = 161838
	echo "File sizes OK" >&2

commoncrawl.cs-en.en commoncrawl.cs-en.cs: training-parallel-commoncrawl.tgz
	tar xpzvmf $< $@

training-parallel-commoncrawl.tgz:
	wget "http://statmt.org/wmt13/training-parallel-commoncrawl.tgz"

.SECONDARY:
