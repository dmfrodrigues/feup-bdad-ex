LATEX=latexmk -f -interaction=nonstopmode --shell-escape -pdf

all: exams/BDAD_exams.pdf book/BDAD_book.pdf

OUTFILES_EXTRA = $(shell find . -name "BDAD_*.tex" | sed 's/.tex/.pdf/g')

extra: $(OUTFILES_EXTRA)

%.pdf: %.tex
	cd $(<D) && $(LATEX) $(<F)

test: FORCE
	make -C tp test
	make -C exams test

clean:
	cd exams && latexmk -C

FORCE:
