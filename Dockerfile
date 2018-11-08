FROM jgoldfar/pandoc-docker-bibtex:latest

# Previously, and thanks to:
# MAINTAINER James Gregory <james@jagregory.com>
MAINTAINER Jonathan Goldfarb <jgoldfar@gmail.com>

# install latex packages, make, git
RUN apt-get update -y && \
    apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    python3-pip && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install nbconvert

# Set CWD to /source on entry.
# Add -v `pwd`:/source to your run command to make the files in your working
# directory available to pandoc
WORKDIR /source

# Expose /source as an external volume
VOLUME /source

RUN ls -lR /usr/local

ENTRYPOINT ["/root/.cabal/bin/pandoc"]

CMD ["--help"]
