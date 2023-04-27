FROM ruby:3.2-slim

RUN set -x && \
    apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/* && \
    gem install bundler keycutter

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
