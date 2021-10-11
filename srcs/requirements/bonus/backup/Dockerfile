FROM alpine

RUN apk add --no-cache go

WORKDIR /app
COPY conf .
RUN go mod tidy

CMD [ "go", "run", "main.go" ]
