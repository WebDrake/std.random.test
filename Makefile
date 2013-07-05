DC = dmd
DFLAGS = -debug -unittest
LIBSRC = test/*.d
PROGS = smallsample largesample uniform

all: $(PROGS)

%: %.d
	$(DC) $(DFLAGS) -of$* $*.d $(LIBSRC)

.PHONY: clean

clean:
	rm -f $(PROGS) *.o *.di

doc-clean:
	rm -rf html
