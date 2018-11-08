# Pandoc & nbconvert Docker Container

[![Docker Build Status](https://img.shields.io/docker/build/jgoldfar/pandoc-nbconvert-docker.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/jgoldfar/pandoc-nbconvert-docker.svg)](https://hub.docker.com/r/jgoldfar/pandoc-nbconvert-docker/)

[Docker](https://www.docker.io/) container for the source distribution of [Pandoc](http://johnmacfarlane.net/pandoc), with Latex tools and [jupyter-nbconvert](https://nbconvert.readthedocs.io/en/latest/index.html) installed.
In particular, this image is meant to allow compilation of PDF files directly from TeX, as well as conversion of TeX to other, open formats such as HTML.

    docker run jgoldfar/pandoc-nbconvert-docker

A `/source` directory is created in the container, which can be mapped for use with relative file paths.
Pandoc will always be run from the `/source` directory in the container.

## Examples
Run Jupyter with argument `--help`

```
$ docker run --rm -v `pwd`:/source jgoldfar/pandoc-nbconvert-docker --help
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
| ghostscript                  |                          |
| latexmk                      |                          |
| python3-pip                  |                          |
| jupyter                      |                          |
