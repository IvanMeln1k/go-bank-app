FROM golang:alpine AS builder

WORKDIR /usr/local/src

RUN apk add bash gcc musl-dev gettext

# COPY ["go.mod", "go.sum", "./"]
# RUN go mod download

# COPY ./internal ./internal
# COPY ./pkg ./pkg
# COPY ./cmd ./cmd

COPY ./ ./
RUN go work sync
WORKDIR /usr/local/src/worker
RUN go mod download

# CMD go run cmd/app/main.go

RUN go build -o ./bin/app cmd/app/main.go

FROM alpine

COPY --from=builder /usr/local/src/worker/bin/app ./

COPY ./worker/templates ./templates
COPY ./worker/configs ./configs
COPY ./worker/.env .

CMD ["./app"]