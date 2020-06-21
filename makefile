all: exams/BDAD_exams.pdf

%.pdf: %.tex
	cd $(<D) && latexmk -f -interaction=nonstopmode -pdf $(<F)

clean:
	cd exams && latexmk -C

cleanall:
	git clean -dfX
