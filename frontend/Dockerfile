# Build stage
FROM golang:1.16 AS builder

WORKDIR /build

# Copy go.mod and go.sum files
COPY go.mod ./

RUN go mod download

COPY . .

# Set environment variables for Go build
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64

RUN go build -o main .

# Staging stage
FROM alpine:latest  

WORKDIR /home/

COPY --from=builder ["/build/main", "/"]

# Copy the static and template files
COPY ./static /home/static
COPY ./templates /home/templates

EXPOSE 8080

CMD ["/main"]
