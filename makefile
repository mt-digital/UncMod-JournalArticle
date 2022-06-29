
bibms: ms ms.tex ~/workspace/Writing/library.bib
	bibtex ms && bibexport -o this.bib ms && rm this.bib-save-*

figures: mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex 
	pdflatex -output-directory=Figures mainResultsPlots.tex && \
	pdflatex -output-directory=Figures meanNetPayoffs.tex && \
	pdflatex -output-directory=Figures stepResultsPlots.tex 

tau_supplement_figures: mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex 
	pdflatex -output-directory=Figures/sensitivity/sensitivity_tau=0.01 mainResultsPlots.tex && \
	pdflatex -output-directory=Figures/sensitivity/sensitivity_tau=0.01 meanNetPayoffs.tex && \
	pdflatex -output-directory=Figures/sensitivity/sensitivity_tau=0.01 stepResultsPlots.tex && \
	pdflatex -output-directory=Figures/sensitivity/sensitivity_tau=1.0 mainResultsPlots.tex && \
	pdflatex -output-directory=Figures/sensitivity/sensitivity_tau=1.0 meanNetPayoffs.tex && \
	pdflatex -output-directory=Figures/sensitivity/sensitivity_tau=1.0 stepResultsPlots.tex && 

ms: bibms figures

ms: bibms figures
	pdflatex ms.tex

oms: bibms
	open ms.pdf

clean: 
	rm ms.{aux,log,out,bbl,blg}
