FROM ruby:2.5-alpine

ENV PATH "/usr/local/bundle/bin:${PATH}"

RUN apk add --update musl-dev gcc make g++ && rm -rf /var/cache/apk/*

RUN gem install cf-uaac -v 3.2.0 --no-rdoc --no-ri

RUN apk add --no-cache curl

ENTRYPOINT ["/usr/bin/sh"]
