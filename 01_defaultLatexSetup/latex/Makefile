# A default Makefile to run with the default LaTeX document setup
# run make to generate the default pdf from default.tex
# run make clean to remove all temporary files

PDFLATEX=pdflatex
TEXFILE=default
BIBTEX=bibtex

default: $(default.tex)
	$(PDFLATEX) $(TEXFILE).tex
	$(BIBTEX) $(TEXFILE)1.aux
	$(BIBTEX) $(TEXFILE)2.aux
	$(PDFLATEX) $(TEXFILE).tex
	$(PDFLATEX) $(TEXFILE).tex

clean:
	-rm *.aux *.log *.bbl *.lol *.lot *.toc *.lof *.out *.blg
