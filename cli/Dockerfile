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
COPY --from=builder /go/stolon/bin/stolonctl /usr/local/bin
RUN chmod +x /usr/local/bin/stolonctl
