FROM node:alpine3.10

RUN mkdir /app

WORKDIR /app

ADD package.json /app/

RUN npm install
