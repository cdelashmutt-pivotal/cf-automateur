FROM ubuntu:bionic

ENV PATH "/usr/local/bundle/bin:${PATH}"

RUN apt-get update && apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt1-dev libxml2-dev libssl-dev libreadline7 libreadline-dev libyaml-dev libsqlite3-dev sqlite3 curl wget git \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN gem install --no-document cf-uaac && gem cleanup

COPY bosh-cli/* om/* credhub-cli/* /usr/local/bin/