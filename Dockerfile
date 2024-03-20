FROM ruby:3.2.2

ENV DOCKER_DB_HOST="db"

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       postgresql-client \
                       vim \
                       libgeos-dev

RUN mkdir /ToCSA
WORKDIR /ToCSA

COPY Gemfile Gemfile.lock  /ToCSA/

RUN gem install bundler
RUN bundle config set build.rgeo --with-geos-dir=/usr
RUN bundle

COPY . .

# RUN ["/bin/bash", "-c", "source .env"]
