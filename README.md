## Compiling user manual
### To PDF
Simple command to compile English manual 

	pandoc *.md -o manual.pdf

Extended command to compile Russian manual

	pandoc --include-in-header ~/pandoc-ru.tex *.md -o manual.pdf

### To HTML

Plain HTML file
 
	pandoc *.md -o manual.html

Styled HTML file with `pandoc.css`

	pandoc --include-in-header pandoc.css *.md -o manual.html

## Tools

* [Pandoc](http://johnmacfarlane.net/pandoc/) -- converting documents form Markdown to PDF, HTML, Word, etc.

* [Markdown Syntax](http://daringfireball.net/projects/markdown/) -- Markdown is intended to be as easy-to-read and easy-to-write as is feasible.

* [MultiMarkdown](http://fletcherpenney.net/multimarkdown/) -- MultiMarkdown is a superset of the Markdown syntax, originally created by John Gruber. It adds multiple syntax features (tables, footnotes, and citations, to name a few).

* [Типограф](http://www.artlebedev.ru/tools/typograf/) -- автоматический типограф текстов.