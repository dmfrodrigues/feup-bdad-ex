LATEX=latexmk -f -interaction=nonstopmode --shell-escape -pdf

all: exams/BDAD_exams.pdf

OUTFILES_EXTRA = $(shell find . -name "BDAD_*.tex" | sed 's/.tex/.pdf/g')

extra: $(OUTFILES_EXTRA)

%.pdf: %.tex
	cd $(<D) && $(LATEX) $(<F)

test: FORCE
	make -C 04-sql-ddl test
	make -C 05-querying test

clean:
	cd exams && latexmk -C

FORCE:
