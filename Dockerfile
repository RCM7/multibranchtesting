FROM node:12.14.1-alpine3.11

ENV APP_PATH /app
RUN mkdir -p $APP_PATH

WORKDIR $APP_PATH

ADD package.json $APP_PATH

RUN set -x && \
  apk add --no-cache curl chromium && \
  npm install


