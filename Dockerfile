FROM golang:1.16.7-alpine3.14 AS build

RUN apk update && apk add git && apk add curl

WORKDIR /go/src/github.com/planetlabs/draino
COPY . .

RUN go build -o /draino ./cmd/draino

FROM alpine:3.14

RUN apk update && apk add ca-certificates
RUN addgroup -S user && adduser -S user -G user
USER user
COPY --from=build /draino /draino
