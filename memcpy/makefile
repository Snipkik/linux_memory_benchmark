GCC=gcc

CFLAGS=-Wall -g

OFLAGS=-O3

FILES=memcpy.c stats.c

all: memcpy_SSE_AVX

memcpy_SSE_AVX: $(FILES)
	$(GCC) $(CFLAGS) $(OFLAGS) $(FILES) -o $@ -lm

clean: memcpy
	@clean
	@rm $<
