FROM golang:1.7.3 as build
WORKDIR /go/src/test/multi-stage-demo
COPY . .
#RUN cd /test/multi-stage-demo
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# FROM alpine:latest  
# RUN apk --no-cache add ca-certificates
# ARG workspace
# WORKDIR /root/
# COPY --from=build /Users/lengrongfu/docker/workspace/multi-stage-demo/main .
# CMD ["./main"]

FROM scratch

COPY --from=build /go/src/test/multi-stage-demo/main \
                 /go/src/test/multi-stage-demo/config.json \
                 /go/src/test/multi-stage-demo/docker-entrypoint.sh \
                /root/
EXPOSE 80

ENTRYPOINT [ "/root/main","-conf=/root/config.json" ]
