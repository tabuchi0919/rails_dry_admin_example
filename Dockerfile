FROM ruby:3.0.2-alpine

WORKDIR /myapp

RUN apk add --no-cache build-base sqlite-dev tzdata

COPY Gemfile Gemfile.lock ./
RUN bundle -j4

COPY . .
