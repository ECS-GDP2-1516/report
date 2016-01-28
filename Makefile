
FILES := $(wildcard appendices/*.tex) $(wildcard conclusion/*.tex) $(wildcard embedded/*.tex) $(wildcard embedded/emulation/*.tex) $(wildcard intro/*.tex) $(wildcard management/*.tex) $(wildcard results/*.tex) $(wildcard software/*.tex) $(wildcard study/*.tex) $(wildcard research/*.tex)
PLOTS := $(wildcard figures/*.tex)
PLOT_TARGETS := $(PLOTS:.tex=.pdf)


.PHONY: all wordcount clean cleanpdfs cleanall

all: report.pdf wordcount

report.pdf: report.tex $(FILES) .style/ecsgdp.cls $(PLOT_TARGETS) _aux/report.bbl
	lualatex --output-directory=_aux report
	mv _aux/report.pdf ./report.pdf
	touch _aux/report.bbl
	@echo ""

wordcount:
	@./texcount.pl -inc -total intro/intro.tex study/study.tex research/research.tex embedded/embedded.tex software/software.tex results/results.tex management/management.tex conclusion/conclusion.tex

%.pdf: %.tex 
	cd figures/ && lualatex --output-directory=_aux $(notdir $<)
	cp figures/_aux/*.pdf ./figures/

clean:
	rm -f _aux/* figures/_aux/*

cleanpdfs:
	rm -f report.pdf $(PLOT_TARGETS)

cleanall: clean cleanpdfs

$(FILES):

report.tex:

ecsgdp.cls:

ECS.bib:

_aux/report.aux:
	lualatex --output-directory=_aux report

_aux/report.bbl: _aux/report.aux ECS.bib
	bibtex $<
