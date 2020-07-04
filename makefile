LATEX=latexmk -f -interaction=nonstopmode -pdf

all: exams/BDAD_exams.pdf

OUTFILES_EXTRA = $(shell find . -name "BDAD_*.tex" | sed 's/.tex/.pdf/g')

extra: $(OUTFILES_EXTRA)

%.pdf: %.tex
	cd $(<D) && $(LATEX) $(<F)

clean:
	cd exams && latexmk -C

cleanall:
	git clean -dfX
