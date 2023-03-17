# Start from the official Golang image
FROM golang:1.17-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# Build the binary executable
RUN CGO_ENABLED=0 go build -o http-echo .
RUN go mod download


# Create a minimal image with the binary executable
FROM scratch
COPY --from=build /app/http-echo /http-echo

# Set the port that the container will listen on
EXPOSE 5678

# Set the default text to echo (can be overridden with ECHO_TEXT environment variable)
ENV ECHO_TEXT="Bilal Test"

# Start the http-echo server when the container starts
CMD ["/http-echo", "-listen=:5678", "-text=${ECHO_TEXT}"]



# FROM golang:alpine AS builder

# RUN apk add --no-cache git

# WORKDIR /build

# COPY . .

# RUN go mod download

# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o http-echo .

# FROM alpine:latest

# RUN apk --no-cache add ca-certificates

# WORKDIR /root/

# COPY --from=builder /build/http-echo /app/http-echo 

# CMD ["./http-echo"]
