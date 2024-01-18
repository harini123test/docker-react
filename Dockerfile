FROM node:21.6 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:21.6
COPY --from=node:21.6 /app/build /usr/share/nginx/html
