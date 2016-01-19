
FILES := $(wildcard appencides/*.tex) $(wildcard conclusion/*.tex) $(wildcard hardware/*.tex) $(wildcard intro/*.tex) $(wildcard management/*.tex) $(wildcard results/*.tex) $(wildcard software/*.tex) $(wildcard study/*.tex)
PLOTS := $(wildcard software/plots/*.tex)
PLOT_TARGETS := $(PLOTS:.tex=.pdf)


.PHONY: all wordcount clean cleanpdfs cleanall

all: report.pdf wordcount

report.pdf: report.tex $(FILES) ecsdocs/ecsgdp.cls $(PLOT_TARGETS)
	lualatex report
	lualatex report
	@echo ""

wordcount:
	@../../texcount.pl -inc -total report.tex

%.pdf: %.tex 
	cd software/plots/ && lualatex $(shell basename $<)

clean:
	rm -f report.aux report.lof report.log report.lol report.lot report.out report.toc $(PLOT_TARGETS:.pdf=.aux) $(PLOT_TARGETS:.pdf=.log)

cleanpdfs:
	rm -f report.pdf $(PLOT_TARGETS)

cleanall: clean cleanpdfs

$(FILES):

report.tex:

ecsgdp.cls:

