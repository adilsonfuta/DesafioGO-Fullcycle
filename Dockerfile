FROM golang:1.17-alpine as builder

WORKDIR /app

COPY . .

RUN go build -o main .

FROM scratch

COPY --from=builder /app/main /app/main

CMD [ "/app/main" ]