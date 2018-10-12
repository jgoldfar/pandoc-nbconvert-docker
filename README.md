# Pandoc Docker Container

[![Docker Build Status](https://img.shields.io/docker/build/jgoldfar/pandoc-docker-bibtex.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/pandoc-docker-bibtex.svg)](https://hub.docker.com/r/jgoldfar/pandoc-docker-bibtex/)

[Docker](https://www.docker.io/) container for the source distribution of [Pandoc](http://johnmacfarlane.net/pandoc), with Latex tools installed.

    docker run jgoldfar/pandoc-docker-bibtex

    pandoc [OPTIONS] [FILES]
    Input formats:  docbook, haddock, html, json, latex, markdown, markdown_github,
                    markdown_mmd, markdown_phpextra, markdown_strict, mediawiki,
                    native, opml, rst, textile
    Output formats: asciidoc, beamer, context, docbook, docx, dzslides, epub, epub3,
                    fb2, html, html5, json, latex, man, markdown, markdown_github,
                    markdown_mmd, markdown_phpextra, markdown_strict, mediawiki,
                    native, odt, opendocument, opml, org, pdf*, plain, revealjs,
                    rst, rtf, s5, slideous, slidy, texinfo, textile
                    [*for pdf output, use latex or beamer and -o FILENAME.pdf

A `/source` directory is created in the container, which can be mapped for use with relative file paths.
Pandoc will always be run from the `/source` directory in the container.

## Examples
Generate HTML from Markdown
```
$ docker run --rm -v `pwd`:/source jgoldfar/pandoc-docker-bibtex -o example.html example.md
```

Generate PDF from Markdown
```
$ docker run --rm -v `pwd`:/source jgoldfar/pandoc-docker-bibtex -o example.pdf example.md
```

Generate HTML5 (Explicitly) from a Markdown file
```
$ docker run -v `pwd`:/source jgoldfar/pandoc-docker-bibtex -f markdown -t html5 myfile.md -o myfile.html
```

Generate HTML + MathJaX from a LaTeX file
```
$ docker run -v `pwd`:/source jgoldfar/pandoc-docker-bibtex --from latex+raw_tex --to html5 --mathjax fileIn.tex -o fileOut.html
```

## Installed Packages

| apt/LaTeX                    | Pandoc                   |
| ---------------------------- | ------------------------ |
| make                         | pandoc-2.3               |
| git                          | pandoc-citeproc          |
| ca-certificates              | pandoc-citeproc-preamble |
| locales                      | pandoc-crossref          |
| lmodern                      |                          |
| texlive-latex-base           |                          |
| texlive-fonts-recommended    |                          |
| texlive-generic-recommended  |                          |
| texlive-lang-english         |                          |
| latex-xcolor                 |                          |
| texlive-math-extra           |                          |
| texlive-latex-extra          |                          |
| texlive-bibtex-extra         |                          |
| biber                        |                          |
| fontconfig                   |                          |
| texlive-xetex                |                          |
| imagemagick                  |                          |