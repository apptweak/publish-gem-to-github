FROM ruby:3.2-alpine

RUN set -x \
    apk add --no-cache git && \
    gem install bundler keycutter

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
