FROM golang:1.14-alpine AS builder
ENV STOLON=0.16.0
WORKDIR /dist
RUN apk update && apk add unzip curl make \
   && curl -o ./stolon.zip -L https://github.com/sorintlab/stolon/archive/v$STOLON.zip \
   && unzip ./stolon.zip -d ./ \
   && rm -f ../stolon.zip \
   && mv ./stolon-$STOLON ./stolon \
   && cd ./stolon \
   && go mod download \
   && make \
   && ls -la /dist/stolon/bin

FROM alpine
EXPOSE 5432
# copy the agola-web dist
COPY --from=builder /dist/stolon/bin/stolon-proxy /usr/local/bin
RUN chmod +x /usr/local/bin/stolon-proxy
