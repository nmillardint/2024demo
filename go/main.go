package main

import (
	"context"
	"errors"
	"fmt"
	"github.com/gofiber/fiber/v2"
	"go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp"
	"go.opentelemetry.io/otel/sdk/resource"
	"log"
	"net/http"
	"time"

	"github.com/gofiber/contrib/otelfiber"
	"go.opentelemetry.io/otel"
	"go.opentelemetry.io/otel/attribute"
	//"go.opentelemetry.io/otel/exporters/jaeger"
	"go.opentelemetry.io/otel/propagation"
	sdktrace "go.opentelemetry.io/otel/sdk/trace"
	semconv "go.opentelemetry.io/otel/semconv/v1.4.0"
	oteltrace "go.opentelemetry.io/otel/trace"
)

var tracer = otel.Tracer("fiber-server")
var client = http.Client{Timeout: time.Duration(1) * time.Second}

func main() {

	tp := initTracer()
	defer func() {
		if err := tp.Shutdown(context.Background()); err != nil {
			log.Printf("Error shutting down tracer provider: %v", err)
		}
	}()

	app := fiber.New()

	app.Use(otelfiber.Middleware())

	app.Get("/error", func(ctx *fiber.Ctx) error {
		return errors.New("abc")
	})

	app.Get("/fetch/:id", func(c *fiber.Ctx) error {
		id := c.Params("id")
		name := getThing(c.UserContext(), id)
		return c.JSON(fiber.Map{"id": id, name: name})
	})

	log.Fatal(app.Listen(":3000"))
}

func initTracer() *sdktrace.TracerProvider {
	exporter, err := otlptracehttp.New(context.Background())
	if err != nil {
		log.Fatal(err)
	}
	tp := sdktrace.NewTracerProvider(
		sdktrace.WithSampler(sdktrace.AlwaysSample()),
		sdktrace.WithBatcher(exporter),
		sdktrace.WithResource(
			resource.NewWithAttributes(
				semconv.SchemaURL,
			)),
	)
	otel.SetTracerProvider(tp)
	otel.SetTextMapPropagator(propagation.NewCompositeTextMapPropagator(propagation.TraceContext{}, propagation.Baggage{}))
	return tp
}

func getThing(ctx context.Context, id string) string {
	thingCtx, span := tracer.Start(ctx, "getThing", oteltrace.WithAttributes(attribute.String("id", id)))
	defer span.End()
	if id == "1" {
		return id + ": Hello Graeme"
	} else if id == "2" {
		return id + ": Hello Mikey"
	} else if id == "3" {
		return id + ": Hello Nicholas"
	}

	dohttp(thingCtx, "childhttp")
	dohttp(ctx, "siblinghttp")

	return id + ": I don't know you"
}

func dohttp(ctx context.Context, spanName string){
	_, span := tracer.Start(ctx, spanName)
	defer span.End()

	_, err := client.Get("https://www.google.com")

	if err != nil {
		fmt.Printf("Error %s", err)
		return
	}

}
