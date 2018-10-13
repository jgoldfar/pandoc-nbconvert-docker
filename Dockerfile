FROM haskell:8.0

# Previously, and thanks to:
# MAINTAINER James Gregory <james@jagregory.com>
MAINTAINER Jonathan Goldfarb <jgoldfar@gmail.com>

# install latex packages, make, git
RUN apt-get update -y && \
    apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    make \
    git \
    ca-certificates \
    locales \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern \
    latexmk \
    imagemagick \
    ghostscript && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cabal update && mkdir -p ~/.cabal

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
# Apparently the latest version that will successfully build with cabal is 2.1.3
ENV PANDOC_VERSION "2.1.3"

# install pandoc
RUN cabal install \
    pandoc-${PANDOC_VERSION} \
    pandoc-citeproc \
    pandoc-citeproc-preamble \
    latex-formulae-pandoc \
    pandoc-crossref

# Set the locale
RUN dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set CWD to /source on entry.
# Add -v `pwd`:/source to your run command to make the files in your working
# directory available to pandoc
WORKDIR /source

# Expose /source as an external volume
VOLUME /source

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
