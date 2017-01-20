FROM node:7.2-alpine

MAINTAINER dev@dankempster.co.uk

RUN set -x; \
    apk add --update git unzip; \
    npm install -g bower;

COPY .bowerrc /

RUN set -x; \
    mkdir /project; \
    mkdir -p /bower/links; \
    mkdir /bower/packages; \
    mkdir /bower/repository; \
    mkdir /var/www; \
    \
    chown -R www-data:www-data /project; \
    chown -R www-data:www-data /bower; \
    chown www-data:www-data /.bowerrc; \
    chown -R www-data:www-data /var/www; \
    \
    chmod -R 2775 /project; \
    chmod -R 2775 /bower; \
    chmod -R 2775 /var/www; \
    chmod -R 0664 /.bowerrc;

WORKDIR /project

VOLUME /bower

USER www-data

#ENTRYPOINT bower
CMD [ "bower" ]