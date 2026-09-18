.PHONY: all prepare fallback ci strict doctor proposal skripsi check check-strict clean cleanall

all prepare fallback ci strict doctor proposal skripsi check check-strict clean cleanall:
	$(MAKE) -C latex-work-dir $@
