GCC=gcc

CFLAGS=-Wall -g

OFLAGS=-O3

FILES=pc.c stats.c

all: pc_SSE_AVX

pc_SSE_AVX: $(FILES)
	$(GCC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ -lm

clean: pc
	@clean
	@rm $<
