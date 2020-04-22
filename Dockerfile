FROM node:10-alpine

ENV LANG C.UTF-8

# Install base packages
RUN apk update
RUN apk upgrade
RUN apk add ca-certificates && update-ca-certificates
# Change TimeZone
RUN apk add --update tzdata
ENV TZ=Europe/Berlin
# Clean APK cache
RUN rm -rf /var/cache/apk/*

# Install necessary libs
RUN apk add py3-pip python3-dev make gcc musl-dev libffi-dev libxml2-dev libxslt-dev libressl-dev git vim

# Install python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install virtualenv


COPY /buerro/ /usr/src/app/ 
COPY /main.sh /usr/src/app/main.sh 
WORKDIR /usr/src/app

ENV PY_VERSION 3
RUN make install

ENV BACKEND_PORT 8081
ENV FRONTEND_PORT 8080
EXPOSE 8080

#CMD ./main.sh
CMD ["sh", "main.sh"]
