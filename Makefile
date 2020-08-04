CPUC      = gcc
CFLAGS_SEQ    = -O3 --std=c11 -m64 	 #     -Wunused-variable #-Wno-conversion-null -Wdelete-non-virtual-dtor
CFLAGS_PARALLEL = -fopenmp -Ofast --std=c11 -m64
DEFS      =
INCLUDES  =
LIBDIR   = -L/usr/lib
LIBS     = -lm
LINK     =  $(LIBDIR) $(LIBS)
CPU_COMPILE_C  = $(CPUC) $(DEFS) $(INCLUDES) $(CFLAGS)

all:
	$(CPU_COMPILE_C) main-n-bodies.c  $(LINK)   -o n-bodies $(CFLAGS_SEQ)
	$(CPU_COMPILE_C) main-n-bodies-parallel.c  $(LINK)   -o n-bodies-parallel $(CFLAGS_PARALLEL)

clean:
	rm n-bodies
	rm n-bodies-parallel
