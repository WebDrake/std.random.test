DC = dmd
DFLAGS = -debug -unittest
LIBSRC = test/*.d
PROGS = smallsample largesample

all: $(PROGS)

smallsample: smallsample.d $(LIBSRC)
	$(DC) $(DFLAGS) -of$@ $^

largesample: largesample.d $(LIBSRC)
	$(DC) $(DFLAGS) -of$@ $^

.PHONY: clean

clean:
	rm -f $(PROGS) *.o *.di

doc-clean:
	rm -rf html
