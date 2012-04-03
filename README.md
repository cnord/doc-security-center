## Compiling user manual
### To PDF
Simple command to compile English manual 

	pandoc *.md -o manual.html

Extended command to compile Russian manual

	pandoc --include-in-header ~/pandoc-ru.tex *.md -o manual.html

### To HTML

Plain HTML file
 
	pandoc *.md -o manual.html

Styled HTML file with `pandoc.css`

	pandoc --include-in-header pandoc.css *.md -o manual.html

## Tools

* [Pandoc](http://johnmacfarlane.net/pandoc/) -- converting documents form markdown to PDF, HTML, Word, etc.

* [Markdown Syntax](http://daringfireball.net/projects/markdown/) -- Markdown is intended to be as easy-to-read and easy-to-write as is feasible.