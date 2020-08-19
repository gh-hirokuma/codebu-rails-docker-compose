FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs


RUN mkdir /app_name

ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

ADD ./src/Gemfile $APP_ROOT/Gemfile
ADD ./src/Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD ./src $APP_ROOT
