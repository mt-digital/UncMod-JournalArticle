
bibms: ms ms.tex ~/workspace/Writing/library.bib
	bibtex ms && bibexport -o this.bib ms && rm this.bib-save-*

figures: tau_supplement_figures mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex 
	pdflatex -output-directory=Figures mainResultsPlots.tex && \
	pdflatex -output-directory=Figures meanNetPayoffs.tex && \
	pdflatex -output-directory=Figures stepResultsPlots.tex 

tau_supplement_figures: mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex 
	pdflatex -output-directory=Figures/supplement/sensitivity_tau=0.01 Figures/supplement/sensitivity_tau=0.01/mainResultsPlots.tex && \
	pdflatex -output-directory=Figures/supplement/sensitivity_tau=1.0 Figures/supplement/sensitivity_tau=1.0/mainResultsPlots.tex  

ms: bibms figures

ms: bibms figures
	pdflatex ms.tex

oms: bibms
	open ms.pdf

clean: 
	rm ms.{aux,log,out,bbl,blg}
