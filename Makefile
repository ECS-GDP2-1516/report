
TARGETS = report.pdf wordcount

.PHONY: all $(TARGETS)

all: $(TARGETS)

$(TARGETS):
	cd tex/latex && make $@