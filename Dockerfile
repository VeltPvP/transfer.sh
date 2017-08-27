FROM golang:1.7
MAINTAINER Remco Verhoef <remco@dutchcoders.io>

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/veltpvp/velt.sh

# build & install server
RUN go build -o /go/bin/transfersh github.com/veltpvp/velt.sh

ENTRYPOINT ["/go/bin/transfersh", "--listener", ":80", "--provider", "s3"]  

EXPOSE 8080 8080
