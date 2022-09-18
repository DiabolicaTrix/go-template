FROM golang:1.19-alpine as builder

WORKDIR /build

COPY . . 

RUN go mod download

RUN go build -o /build/app ./cmd/app/main.go

FROM alpine:3.16.2

COPY --from=builder /build/app /app/

WORKDIR /app
RUN apk --no-cache add bash

RUN chmod +x /app/app

RUN adduser -S appuser
USER appuser

ENTRYPOINT ["/app/app"]
