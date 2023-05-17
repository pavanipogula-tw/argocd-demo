FROM golang:1.17-alpine AS build
WORKDIR /app
COPY  . .
RUN go build -o argo-demo

FROM alpine:latest
COPY --from=build /app/argo-demo /bin/argo-demo
ENTRYPOINT [ "/bin/argo-demo"]