FROM golang

WORKDIR /usr/src/app

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY *.go ./

RUN go build -v -o /usr/local/bin/app ./...

#ENV OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://fr-observability:4318/v1/traces
#ENV OTEL_EXPORTER_OTLP_METRICS_ENDPOINT=http://fr-observability:4318/v1/metrics
#ENV OTEL_SERVICE_NAME=gooteldemo
#ENV OTEL_RESOURCE_ATTRIBUTES="application=graemeotel"

CMD ["app"]

#CMD app > gooteldemo.log

#end
