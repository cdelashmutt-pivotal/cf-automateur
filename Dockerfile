FROM ruby:2.5-alpine

ENV PATH "/usr/local/bundle/bin:${PATH}"

RUN apk add --no-cache musl-dev gcc make g++ curl jq zlib zlib-dev ruby-dev openssl libxslt-dev readline-dev sqlite sqlite-dev git bash build-base file linux-headers libc6-compat
RUN gem install cf-uaac -v 3.2.0 --no-rdoc --no-ri

COPY deps/bosh /usr/local/bin/bosh
COPY deps/om /usr/local/bin/om
COPY deps/credhub /usr/local/bin/credhub