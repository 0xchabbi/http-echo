FROM golang:alpine AS builder

RUN apk add --no-cache git

WORKDIR /build

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o http-echo .

FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /build/http-echo /app/http-echo 

CMD ["./http-echo"]
