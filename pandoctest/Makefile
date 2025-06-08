
help:
	@grep -E '^[0-9a-zA-Z_-]+[[:blank:]]*:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[1;32m%-30s\033[0m %s\n", $$1, $$2}'

#現在のブランチ名「だけ」を得る
WORKING-BRANCH := $(shell git rev-parse --abbrev-ref @)

BIBFILE := reference.bib

PREAMBLE := preamble.tex

CLUTS := cluts

CLUTTEX-MAX-ITERATION:=3

BIBTEXOPTION := upbibtex -kanji=utf8 -kanji-internal=euc

CLUTTEX := cluttex --engine=lualatex --output-directory='./${CLUTS}' --max-iterations=${CLUTTEX-MAX-ITERATION} --bibtex='${BIBTEXOPTION}'

%.pdf: %.md ${PREAMBLE} ${BIBFILE}
	$(eval TEXFILE = $(basename $<).tex)
	mkdir -p ${CLUTS}
	cp -f ${BIBFILE} ${CLUTS}
	pandoc $< --standalone --output=${TEXFILE}
	${CLUTTEX} -o $@ -- ${TEXFILE}
	mv ${TEXFILE} ${CLUTS}

add : ## add files
	git add Makefile test1.md ${PREAMBLE} ${BIBFILE}

pushanyway : add 
	$(eval DATE=$(shell date "+%Y-%m-%d--%H:%M"))
	$(eval CHANGES=$(shell git diff --name-only --cached -- .))
	$(eval MESSAGE=pandoctest-$$(DATE))
	$(eval MESSAGE+=  [CHANGES]:)
	$(eval MESSAGE+=$$(CHANGES))
	@git commit -m "$(MESSAGE)" || echo '*** commit failed ***'
	git push origin $(WORKING-BRANCH)

test1 : test1.pdf ## generate test1.pdf 