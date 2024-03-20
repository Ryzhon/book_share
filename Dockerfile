FROM ruby:3.2.2

ENV DOCKER_DB_HOST="db"

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       postgresql-client \
                       vim

RUN mkdir /book_share
WORKDIR /book_share

COPY Gemfile Gemfile.lock  /book_share/

RUN gem install bundler
RUN bundle

COPY . .

# RUN ["/bin/bash", "-c", "source .env"]
