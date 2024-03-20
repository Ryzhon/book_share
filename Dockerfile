FROM ruby:3.2.2

ENV DOCKER_DB_HOST="db"

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       postgresql-client \
                       vim

RUN mkdir /book_share
WORKDIR /book_share

COPY Gemfile Gemfile.lock /book_share/
RUN gem install bundler && bundle install

COPY . .
ENV RAILS_ENV=production
ENV RACK_ENV=production
ENV PORT=3000

EXPOSE $PORT

CMD bundle exec rails server -p $PORT -e production
