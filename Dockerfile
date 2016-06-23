# use the golang base image
FROM golang:1.6
MAINTAINER Andreas Galanomatis

# switch to our app directory
RUN mkdir -p /app
WORKDIR /app

# copy the source files
ADD . /app

RUN make release-server

CMD /app/bin/ngrokd -domain="$NGROK_DOMAIN"