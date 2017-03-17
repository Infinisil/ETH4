HTML_OPTIONS +=-c ~/ETH4/style.css

%.pdf: %.md
	mkdir -p pdf
	pandoc $^ -o pdf/$@ $(PDF_OPTIONS)

%.html: %.md
	mkdir -p html
	pandoc $^ -o html/$@ $(HTML_OPTIONS)

html: *.md
	mkdir -p html
	pandoc $(sort $^) -o html/all.html $(HTML_OPTIONS)	

pdf: *.md
	mkdir -p pdf
	pandoc $(sort $^) --toc -o pdf/all.pdf $(PDF_OPTIONS)

clean:
	rm -rf pdf
	rm -rf html
