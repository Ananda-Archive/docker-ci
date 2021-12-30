FROM alpine as builder
RUN apk add --update nodejs && apk add --update npm
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html