fullpath := $(shell pwd -P)
LATEXMK := latexmk -pdf -dvi- -ps- -r ${fullpath}/.latexmkrc

target := klmr-cv
includes := $(shell ls *.{tex,cls})

all: ${target} thumbnail

push: all
	git add ${target}.pdf thumbnail.png
	git commit -m 'Recompile document, update thumbnail'
	git push

.PHONY: ${target}
${target}: ${target}.pdf

${target}.pdf: ${includes}

%.pdf: %.tex
	cd $$(dirname $@); ${LATEXMK} $$(basename $<)

# Interactive preview rule; not really a target per se.

.PHONY: preview
preview:
	${LATEXMK} -pvc ${target}

.PHONY: thumbnail
thumbnail: thumbnail.png

thumbnail.png: ${target}.pdf
	convert -density 300 -format png -thumbnail 500 -flatten $< \
		-background black \( +clone -shadow 60x2+2+2 \) +swap \
		-background none -flatten \
		$@

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
	${RM} thumbnail.png
