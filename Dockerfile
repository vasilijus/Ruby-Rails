FROM ruby:latest

RUN apt-get update -yqq \
    && apt-get isntall -yqq --no-install-recommends \
        mysql-client \
        && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD rails server -b 0.0.0.0