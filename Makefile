%.pdf: %.md
	mkdir -p pdf
	pandoc $^ -o pdf/$@ $(PDF_OPTIONS)

%.html: %.md
	mkdir -p html
	pandoc $^ -o html/$@
