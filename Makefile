L386PATH = softfloat/build/Linux-386-GCC
BUILDPATH ?= $(L386PATH)
CC        ?= gcc
CFLAGS    ?= -g -fdiagnostics-color=always
DEFS      ?= -DSPECIALIZE_TYPE=RISCV -DSOFTFLOAT_FAST_INT64=1 -DSOFTFLOAT_ROUND_ODD=1
SOFTFLOAT_INC ?= softfloat/source/include
MAIN_SRC  ?= main.c
MAIN_BIN  ?= $(BUILDPATH)/main
# put this with your other vars
ROOT_BIN ?= $(CURDIR)/main

.PHONY: all build clean linux386 run_main main

all: linux386

linux386: BUILDPATH = $(L386PATH)
linux386: build
	

build:
	$(MAKE) -C $(BUILDPATH) SPECIALIZE_TYPE=RISCV SOFTFLOAT_FAST_INT64=1 SOFTFLOAT_ROUND_ODD=1

main: $(MAIN_BIN)

$(MAIN_BIN): $(MAIN_SRC) | build
	$(CC) $(CFLAGS) $(DEFS) -I $(SOFTFLOAT_INC) $< "softfloat/build/Linux-386-GCC/softfloat.a" -o $@

copy_main: main
	@install -m 0755 -T "$(MAIN_BIN)" "$(ROOT_BIN)"
	@echo "Copied $(MAIN_BIN) -> $(ROOT_BIN)"

run_main: linux386 copy_main
	@echo "Running $(ROOT_BIN)…"
	@"$(ROOT_BIN)"

clean:
	@for a in $(shell ls softfloat/build); do \
	if [ -d softfloat/build/$$a ]; then \
	    echo "processing folder $$a"; \
	    $(MAKE) -C softfloat/build/$$a clean; \
	fi; \
	done;
	@rm -f "$(MAIN_BIN)" "$(ROOT_BIN)"
	@echo "Clean done!"

