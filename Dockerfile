FROM node:21.6-alpine3.19 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:21.6-alpine3.19
COPY --from=node:node:21.6-alpine3.19 /app/build /usr/share/nginx/html
