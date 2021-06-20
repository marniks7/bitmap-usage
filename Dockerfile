FROM golang:1.16.5-alpine3.13 AS build_base

ENV CGO_ENABLED=0
#ENV GO111MODULE=on

# work dir
WORKDIR /src

# cache based on mod and sum
COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# build
RUN CGO_ENABLED=0 go build -o ./out/app .

FROM alpine:3.13
RUN apk add ca-certificates

WORKDIR /app

COPY --from=build_base /src/out/app /app/

RUN chmod +x app

EXPOSE 8080

ENTRYPOINT export ADDR=:8080 && ./app