
FROM golang:1.23 AS build

WORKDIR /usr/src/app

COPY go.mod ./
RUN go mod download && go mod verify

COPY cmd ./cmd
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -ldflags '-w' -o /usr/local/bin/app ./cmd/main.go

FROM scratch AS run

WORKDIR /
COPY --from=build /usr/local/bin/app /app
EXPOSE 8080

ENTRYPOINT ["/app"]