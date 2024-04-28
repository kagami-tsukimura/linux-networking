FROM ubuntu:22.04

RUN apt update
RUN apt install -y ruby ruby-bundler

COPY Gemfile .
RUN apt install -y ruby-dev build-essential libmariadb-dev
RUN bundle install