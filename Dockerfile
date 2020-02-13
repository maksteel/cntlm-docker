FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install \
       wget \
       unzip \
       tar \
       g++ \
       make \
       build-essential \
       libkrb5-dev \
       subversion \
       libpam-krb5 \
       krb5-user \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY cntlm-0.92.3 /root/cntlm-0.92.3
WORKDIR /root/cntlm-0.92.3
RUN chmod u+x configure && \
    ./configure && \
    make &&\
    make install
EXPOSE 3128
ENTRYPOINT [ "cntlm", "-a ntlmv2", "-f" ]
