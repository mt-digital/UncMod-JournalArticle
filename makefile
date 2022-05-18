
FIGURES=mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex

bibtex: ms.tex ~/workspace/Writing/library.bib
	bibtex ms && bibexport -o this.bib ms

figures: mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex
	pdflatex mainResultsPlots.tex  # $(FIGURES)

ms: bibtex figures
	pdflatex ms.tex

oms: main
	open ms.pdf
