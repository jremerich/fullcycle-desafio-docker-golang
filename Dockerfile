FROM golang:1.14.3-alpine3.11 as builder

WORKDIR /go/src/app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-w -extldflags "-static"' -o app

FROM scratch
COPY --from=builder /go/src/app /

CMD ["/app"]