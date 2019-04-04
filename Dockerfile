FROM ruby:2.5-alpine

ENV PATH "/usr/local/bundle/bin:${PATH}"

RUN apk add --update musl-dev gcc make g++ && rm -rf /var/cache/apk/*
RUN gem install cf-uaac -v 3.2.0 --no-rdoc --no-ri
RUN apk add --no-cache curl
RUN apk add --no-cache jq
RUN wget https://github.com/pivotal-cf/om/releases/download/0.54.0/om-linux -O /usr/local/bin/om
RUN chmod +x /usr/local/bin/om
RUN apk add libc6-compat
RUN curl -L -s https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.4.0/credhub-linux-2.4.0.tgz | tar -xvzf - -C /usr/local/bin
RUN chmod +x /usr/local/bin/credhub
