FROM klakegg/hugo:0.83.1-onbuild AS hugo

FROM golang:1.17 as build-env

WORKDIR /go/src/app
COPY . /go/src/app/
COPY --from=hugo /target /go/src/app/public

RUN go build -o /go/bin/app

FROM gcr.io/distroless/base
COPY --from=build-env /go/bin/app /
CMD ["/app"]