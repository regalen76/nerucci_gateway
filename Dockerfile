FROM golang:1.23.4 AS dev
WORKDIR /app
RUN go install github.com/air-verse/air@latest
RUN air init
COPY go.mod go.sum ./
RUN go mod download
RUN go mod tidy
CMD ["air", "-c", ".air.toml"]

