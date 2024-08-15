# Build stage
FROM golang:1.16 AS builder

WORKDIR /build

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Set environment variables for Go build
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64

RUN go build -o main .

# Staging stage
FROM alpine:latest  

WORKDIR /home/

COPY --from=builder ["/build/main", "/"]

EXPOSE 9000

CMD ["/main"]
