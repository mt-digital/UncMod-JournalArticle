
bibms: ms ms.tex ~/workspace/Writing/library.bib
	bibtex ms 

figures: nagents_supplement_figures nteachers_supplement_figures tau_supplement_figures full_mean_payoff_supplement_figure mainResultsPlots.tex meanNetPayoffs.tex stepResultsPlots.tex 
	pdflatex -output-directory=Figures mainResultsPlots.tex && \
	pdflatex -output-directory=Figures meanNetPayoffs.tex && \
	pdflatex -output-directory=Figures stepResultsPlots.tex 

tau_supplement_figures: 
	pdflatex -output-directory=Figures/supplement/sensitivity_tau=0.01 Figures/supplement/sensitivity_tau=0.01/mainResultsPlots.tex && \
	pdflatex -output-directory=Figures/supplement/sensitivity_tau=1.0 Figures/supplement/sensitivity_tau=1.0/mainResultsPlots.tex  

nagents_supplement_figures:
	pdflatex -output-directory=Figures/supplement/nagents=50 Figures/supplement/nagents=50/mainResultsPlots.tex && \
	pdflatex -output-directory=Figures/supplement/nagents=200 Figures/supplement/nagents=200/mainResultsPlots.tex  
	pdflatex -output-directory=Figures/supplement/nagents=1000 Figures/supplement/nagents=1000/mainResultsPlots.tex  

nteachers_supplement_figures:
	pdflatex -output-directory=Figures/supplement/nteachers=2 Figures/supplement/nteachers=2/mainResultsPlots.tex && \
	pdflatex -output-directory=Figures/supplement/nteachers=10 Figures/supplement/nteachers=10/mainResultsPlots.tex  
	pdflatex -output-directory=Figures/supplement/nteachers=20 Figures/supplement/nteachers=20/mainResultsPlots.tex  

full_mean_payoff_supplement_figure:
	pdflatex -output-directory=Figures/supplement Figures/supplement/fullMeanPrevNetPayoffs.tex 

ms: bibms figures

ms: bibms figures
	pdflatex ms.tex

oms: bibms
	open ms.pdf

bibsync:
	bibexport -o this.bib ms && rm this.bib-save-*

clean: 
	rm ms.{aux,log,out,bbl,blg}
