FROM golang:1.20 AS builder

WORKDIR /src

COPY main.go ./

RUN go build main.go

FROM scratch

COPY --from=builder /src/main /

ENTRYPOINT [ "/main" ]
