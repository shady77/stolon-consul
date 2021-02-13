FROM golang:1.14-alpine AS builder
ENV STOLON=0.16.0
RUN apk update && apk add unzip curl make
RUN curl -o ./stolon.zip -L https://github.com/sorintlab/stolon/archive/v$STOLON.zip
RUN unzip ./stolon.zip -d ./ \
   && rm -f ./stolon.zip \
   && mv ./stolon-$STOLON ./stolon
WORKDIR /go/stolon/
RUN go mod download
RUN make

FROM alpine
ENV CLUSTER_NAME=stolon-cluster
ENV LOG_LEVEL=debug
ENV CONSUL_URL=http://consul.service:8500
COPY --from=builder /go/stolon/bin/stolon-sentinel /usr/local/bin
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/stolon-sentinel /usr/local/bin/start.sh
CMD start.sh
