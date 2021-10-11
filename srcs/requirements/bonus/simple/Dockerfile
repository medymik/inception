FROM alpine

RUN apk add nodejs

WORKDIR /app

COPY conf/ .

CMD [ "node", "app.js" ]