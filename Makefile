# Executables
latexmk = latexmk

## Required for thumbpdf as latexmk does not support thumbpdf by itself
pdflatex = pdflatex


# Main file name
MASTER = main
MASTER_TEX = $(MASTER).tex
LITERATURE = references.bib


# Derived file names
SRC = 
TEX_FILES = $(wildcard Sections/*.tex glossary.tex page_garde.tex abstract.tex)
GFX_FILES = $(wildcard Images/*)

MASTER_PDF = $(MASTER).pdf

all: $(MASTER_PDF)
.PHONY: $(MASTER_PDF) Chap2.pdf 

$(MASTER_PDF): $(MASTER_TEX) $(LITERATURE) $(TEX_FILES) $(GFX_FILES)
	$(latexmk) -pdf $(MASTER_TEX)

chap2.pdf: chap2.tex Sections/2_securite.tex glossary.tex
	$(latexmk) -pdf chap2.tex 

chap3.pdf: chap3.tex Sections/3_game_theory.tex glossary.tex
	$(latexmk) -pdf chap3.tex

chap4.pdf: chap4.tex Sections/4_resilience.tex glossary.tex
	$(latexmk) -pdf chap4.tex  

clean:
	$(latexmk) -C

final: $(PDF)
	thumbpdf $(PDF)
	$(pdflatex) -pdf $(MASTER_TEX)

mrproper: clean
	rm -f *~

ps: $(MASTER_PDF)
	pdftops $(MASTER_PDF)

pdf: $(MASTER_PDF)

ispell:
	for tex in $(TEX_FILES);	\
		do	\
			ispell -d french $$tex ;	\
		done
#
##
