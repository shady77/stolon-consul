ARG PGVERSION=12
FROM golang:1.14-buster AS builder
ENV STOLON=0.16.0
RUN apt-get update && apt-get install unzip curl make -qy
RUN curl -o ./stolon.zip -L https://github.com/sorintlab/stolon/archive/v$STOLON.zip
RUN unzip ./stolon.zip -d ./ \
   && rm -f ./stolon.zip \
   && mv ./stolon-$STOLON ./stolon
WORKDIR /go/stolon/
RUN go mod download
RUN make

FROM postgres:$PGVERSION
ENV CLUSTER_NAME=stolon-cluster
ENV LOG_LEVEL=debug
ENV CONSUL_URL=http://consul.service:8500
ENV UID=keeper
ENV LISTEN_ADDR=keeper
ENV PASSWORD_FILE=pgsql
ENV REPL_PASSWORD_FILE=pgsql_repl
RUN useradd -ms /bin/bash stolon
EXPOSE 5432
COPY --from=builder /go/stolon/bin/stolon-keeper /usr/local/bin
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/stolon-keeper /usr/local/bin/start.sh
CMD start.sh
