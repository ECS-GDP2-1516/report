
FILES := $(wildcard appencides/*.tex) $(wildcard conclusion/*.tex) $(wildcard hardware/*.tex) $(wildcard intro/*.tex) $(wildcard management/*.tex) $(wildcard results/*.tex) $(wildcard software/*.tex) $(wildcard study/*.tex)
PLOTS := $(wildcard figures/*.tex)
PLOT_TARGETS := $(PLOTS:.tex=.pdf)


.PHONY: all wordcount clean cleanpdfs cleanall

all: report.pdf wordcount

report.pdf: report.tex $(FILES) .style/ecsgdp.cls $(PLOT_TARGETS)
	lualatex --output-directory=.aux report
	mv .aux/report.pdf ./report.pdf
	@echo ""

wordcount:
	@./texcount.pl -inc -total report.tex

%.pdf: %.tex 
	cd figures/ && lualatex --output-directory=.aux $(shell basename $<)
	cp figures/.aux/*.pdf ./figures/

clean:
	rm -f .aux/* figures/.aux/*

cleanpdfs:
	rm -f report.pdf $(PLOT_TARGETS)

cleanall: clean cleanpdfs

$(FILES):

report.tex:

ecsgdp.cls:

