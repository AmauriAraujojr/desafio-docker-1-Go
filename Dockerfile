FROM golang As builder

WORKDIR /app

COPY index.go .

RUN  CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o app index.go

FROM scratch

COPY --from=builder /app/app .

CMD ["./app"]

