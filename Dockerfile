FROM jgoldfar/pandoc-docker-bibtex:latest

MAINTAINER Jonathan Goldfarb <jgoldfar@gmail.com>

# install python3 & pip
RUN apt-get update -y && \
    apt-get install -y -o Acquire::Retries=10 --no-install-recommends \
    python3-pip && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install nbconvert

# Set CWD to /source on entry.
# Add -v `pwd`:/source to your run command to make the files in your working
# directory available to pandoc or jupyter
WORKDIR /source

# Expose /source as an external volume
VOLUME /source

ENTRYPOINT ["/usr/local/bin/jupyter"]

CMD ["--help"]
