FROM golang:1.23 as builder
WORKDIR /app
COPY . /app
RUN go mod tidy
RUN GOOS=linux GOARCH=amd64 go build -o build ./...

FROM alpine:latest
COPY --from=builder /app/build/* /app/
ENTRYPOINT ["/app/gotest1"]