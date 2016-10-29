FROM ruby:alpine
MAINTAINER Darren Oakley <daz.oakley@gmail.com>

RUN apk update && apk upgrade
RUN apk add ruby-dev build-base git
RUN rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN gem install bundler --no-rdoc --no-ri
RUN bundle install

EXPOSE 8125
CMD ["mini_statsd", "8125"]
