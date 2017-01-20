FROM dankempster/node:alpine

MAINTAINER dev@dankempster.co.uk

RUN set -x; \
    apk add --update git unzip; \
    npm install -g bower;

COPY .bowerrc /

RUN set -x; \
    mkdir -p /bower/links; \
    mkdir /bower/packages; \
    mkdir /bower/repository; \
    \
    chown -R www-data:www-data /bower; \
    chown www-data:www-data /.bowerrc; \
    \
    chmod -R 2775 /bower; \
    chmod -R 0664 /.bowerrc;

VOLUME /bower

#ENTRYPOINT bower
CMD [ "bower" ]