FROM golang:1.8.3-alpine3.6


RUN apk add --update bash git make gcc g++

ADD . /go/src/github.com/fighterlyt/mindoc


WORKDIR /go/src/github.com/fighterlyt/mindoc

RUN chmod +x start.sh

RUN  go get -d ./... && \
    go get github.com/mitchellh/gox && \
    gox -os "windows linux darwin" -arch amd64


CMD ["./start.sh"]
