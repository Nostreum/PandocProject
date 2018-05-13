PANDOC=pandoc

SOURCE_DOCS    := `cat index.txt` 
OUTPUT_NAME			= report.pdf

PANDOC_TEMPLATE = template.tex
PDF_ENGINE			= xelatex 

all:
	$(PANDOC) \
		--from markdown+pipe_tables+footnotes \
		--to latex \
		--template $(PANDOC_TEMPLATE) \
		--filter pandoc-citeproc \
		--bibliography report.bib \
		--out $(OUTPUT_NAME) \
		$(SOURCE_DOCS)

.PHONY: all clean

clean:
	rm  $(OUTPUT_NAME)
