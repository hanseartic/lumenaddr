FROM golang AS builder
WORKDIR /go/src/lumenaddr
COPY * /go/src/lumenaddr/
RUN go mod init
RUN go mod vendor
RUN go build

FROM golang
COPY --from=0 /go/src/lumenaddr/lumenaddr /go/lumenaddr
ENTRYPOINT ["/go/lumenaddr"]


