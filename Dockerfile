FROM node:20.11-alpine3.19 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:20.11-alpine3.19
COPY --from=node:20.11-alpine3.19 /app/build /usr/share/nginx/html
