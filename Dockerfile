FROM golang:1.13 as builder
COPY ./ ./
RUN make build
RUN pwd && ls -lah

FROM debian:stretch-slim
COPY --from=builder /go/pgme /

CMD ["/pgme"]
