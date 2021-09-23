FROM ruby:2.3-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/

RUN apk add --no-cache build-base \
    && gem install bundler -v 1.17.2 \
    && bundle install \
    && apk del build-base

RUN bundle install
COPY . $APP_HOME

ENV COMMENT_DATABASE_HOST comment_db
ENV COMMENT_DATABASE comment

CMD ["puma"]
