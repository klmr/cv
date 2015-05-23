fullpath := $(shell pwd -P)
LATEXMK := latexmk -pdf -dvi- -ps- -r ${fullpath}/.latexmkrc

target := klmr-cv
includes := $(shell ls *.{tex,cls})

.PHONY: ${target}
${target}: ${target}.pdf

${target}.pdf: ${includes}

%.pdf: %.tex
	cd $$(dirname $@); ${LATEXMK} $$(basename $<)

# Interactive preview rule; not really a target per se.

.PHONY: preview
preview:
	${LATEXMK} -pvc ${target}

# Cleanup

.PHONY: cleancache
cleancache:
	${RM} -r $(shell biber --cache)

.PHONY: clean
clean: cleancache
	${RM} $(filter-out %.tex %.cls %.pdf,$(shell ls ${target}.*))
	${RM} texput.log
	${RM} xelatex*.fls

.PHONY: cleanall
cleanall: clean
	${RM} ${target}.pdf
