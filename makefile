
bibtex: ms.tex ~/workspace/Writing/library.bib
	bibtex ms && bibexport -o this.bib ms && rm this.bib-save-*

figures: mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex 
	pdflatex -output-directory=Figures mainResultsPlots.tex && \
	pdflatex -output-directory=Figures meanNetPayoffs.tex && \
	pdflatex -output-directory=Figures stepResultsPlots.tex

ms: bibtex figures
	pdflatex ms.tex

oms: ms
	open ms.pdf
