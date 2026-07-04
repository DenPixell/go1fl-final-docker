FROM golang:latest
LABEL authors="denpixel"

WORKDIR /app

COPY go.mod go.sum ./

COPY *.go ./

COPY tracker.db ./

RUN go mod download

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app

CMD ["/my_app"]

# https://hub.docker.com/repository/docker/denpixel/go11-final/general