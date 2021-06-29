DATASETS := $(wildcard */.)

.PHONY: all $(DATASETS)
all: $(DATASETS)

$(DATASETS):
	$(MAKE) -C $@
	$(MAKE) check -C $@
