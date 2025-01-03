FROM nginx:alpine AS base

WORKDIR /app

COPY ./build/nginx.conf /etc/nginx/nginx.conf


FROM base AS build
COPY ./ ./

RUN apk add --no-cache nodejs yarn

WORKDIR /app/flowise-embed

RUN yarn install

RUN yarn build


FROM build AS web

WORKDIR /app

EXPOSE 8080

