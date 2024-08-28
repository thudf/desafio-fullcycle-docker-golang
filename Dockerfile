FROM golang:1.23.0 AS builder

WORKDIR /app

COPY . .

RUN go build -ldflags -w main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app .

ENTRYPOINT [ "./main" ]
