FROM golang:1.14.3-alpine3.11 as builder

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

FROM scratch
COPY --from=builder /go/bin/app /

CMD ["/app"]