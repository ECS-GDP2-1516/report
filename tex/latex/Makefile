
FILES := $(wildcard appencides/*.tex) $(wildcard conclusion/*.tex) $(wildcard hardware/*.tex) $(wildcard intro/*.tex) $(wildcard management/*.tex) $(wildcard results/*.tex) $(wildcard software/*.tex) $(wildcard study/*.tex)

.PHONY: all wordcount

all: report.pdf wordcount

report.pdf: report.tex $(FILES) ecsdocs/ecsgdp.cls
	pdflatex report
	pdflatex report
	@echo ""

wordcount:
	@../../texcount.pl -inc -total report.tex

$(FILES):

report.tex:

ecsgdp.cls: