ARG DIR=/go/src/github.com/tailoredbase/the-a-team

FROM golang:1.14.6-alpine3.12 AS builder
RUN apk add --update bash make git
ARG DIR
WORKDIR $DIR
COPY . ./
RUN make build

FROM alpine:3.12
ARG DIR
COPY --from=builder $DIR/build/the-a-team /
ENTRYPOINT ["/the-a-team"]