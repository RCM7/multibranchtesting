ARG IMAGE=node:13.7.0-alpine3.10

FROM $IMAGE as previous_image

ENV APP_PATH /app
RUN mkdir -p $APP_PATH && \
  touch $APP_PATH/package-lock.json

FROM node:alpine3.10

ENV APP_PATH /app
RUN mkdir -p $APP_PATH

WORKDIR $APP_PATH

COPY --from=previous_image $APP_PATH/package-lock.json .

ADD package.json $APP_PATH

RUN apk add --no-cache curl chromium && \
  npm install
