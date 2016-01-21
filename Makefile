
FILES := $(wildcard appencides/*.tex) $(wildcard conclusion/*.tex) $(wildcard hardware/*.tex) $(wildcard intro/*.tex) $(wildcard management/*.tex) $(wildcard results/*.tex) $(wildcard software/*.tex) $(wildcard study/*.tex)
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
	@./texcount.pl -inc -total report.tex

%.pdf: %.tex 
	cd figures/ && lualatex --output-directory=_aux $(shell basename $<)
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
