# use the golang base image
FROM golang:1.7.3
MAINTAINER Vic van Gool

# switch to our app directory
RUN mkdir -p /app
WORKDIR /app

# copy the source files
ADD . /app

RUN make release-server

CMD /app/bin/ngrokd -domain="$NGROK_DOMAIN"
