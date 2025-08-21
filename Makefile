.PHONY: all zh GIAM-zh GIAM-hw-zh GIAM-solutions_manual-zh
all: GIAM.pdf GIAM-hw.pdf GIAM-solutions_manual.pdf
zh: GIAM-zh GIAM-hw-zh GIAM-solutions_manual-zh

GIAM.pdf: GIAM.aux
	pdflatex GIAM
GIAM.aux: *.tex */*.tex
	cd figures; make
	pdflatex GIAM
	pdflatex GIAM
	makeindex GIAM
	bibtex GIAM
	pdflatex GIAM
GIAM-hw.pdf: GIAM-hw.aux
	pdflatex GIAM-hw
GIAM-hw.aux: *.tex */*.tex
	pdflatex GIAM-hw
GIAM-solutions_manual.pdf: GIAM-solutions_manual.aux
	pdflatex GIAM-solutions_manual
GIAM-solutions_manual.aux: *.tex */*.tex
	pdflatex GIAM-solutions_manual
clean::
	-rm *.aux *~ *.bak *.log *.out *.bbl *.blg *.idx *.ilg *.ind *.lof *.lot *.toc *.pdf
	rm */*.aux */*~ */*.bak */*.log */*.synctex.gz
	cd figures; make clean
	cd slides; make clean
	cd activities; make clean


GIAM-zh: 
	xelatex GIAM-zh
	xelatex GIAM-zh
	makeindex GIAM-zh
	bibtex GIAM-zh
	xelatex GIAM-zh
GIAM-hw-zh: 
	xelatex GIAM-hw-zh
GIAM-solutions_manual-zh: 
	xelatex GIAM-solutions_manual-zh