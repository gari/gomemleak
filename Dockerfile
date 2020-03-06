 
# FROM golang:1.14 AS builder

# WORKDIR /go/src/github.com/gari/kuberntes-oomkill-exporter
# ENV GO111MODULE=on \
#     CGOENABLED=0
# ADD go.mod go.sum ./
# RUN go mod download
# ADD cache/main.go .
# RUN go build -v -o /dev/null
# ADD . .
# RUN go build -v -o /kubernetes-oomkill-exporter
# RUN go test -v
# RUN go vet

FROM alpine:3.8
LABEL maintainer="garillka@gmail.com"

COPY gomemleak /gomemleak
# RUN apk --no-cache add ca-certificates
# COPY --from=builder /kubernetes-oomkill-exporter /kubernetes-oomkill-exporter

ENTRYPOINT ["/gomemleak"]
# CMD ["-logtostderr"]