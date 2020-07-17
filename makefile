LATEXMK=latexmk -f -interaction=nonstopmode --shell-escape -pdf

all: exams/BDAD_exams.pdf book/BDAD_book.pdf

OUTFILES_EXTRA = $(shell find . -name "BDAD_*.tex" | sed 's/.tex/.pdf/g')

extra: $(OUTFILES_EXTRA)

%.pdf: %.tex
ifeq ($(VERSION),)
	cd $(<D) && $(LATEXMK) $(<F)
else
	cd $(<D) && (echo "$(VERSION)" > VERSION) && $(LATEXMK) $(<F) && $(RM) VERSION
endif

test: FORCE
	make -C tp test
	make -C exams test

clean:
	cd exams && latexmk -C

FORCE:
