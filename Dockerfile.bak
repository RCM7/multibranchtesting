ARG IMAGE=node:12.14.1-alpine3.11

FROM $IMAGE as previous_image

ENV APP_PATH /app
RUN mkdir -p $APP_PATH && \
  touch $APP_PATH/package-lock.json

FROM node:12.14.1-alpine3.11

ENV APP_PATH /app
RUN mkdir -p $APP_PATH

WORKDIR $APP_PATH

COPY --from=previous_image $APP_PATH/package-lock.json .

ADD package.json $APP_PATH

RUN set -x && \
  apk add --no-cache curl chromium && \
  npm install


