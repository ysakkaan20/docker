ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-alpine

WORKDIR /home/node
COPY .npmrc /usr/local/etc/npmrc

RUN \
	apk add --update git openssh graphicsmagick tini tzdata ca-certificates libc6-compat && \
	npm install -g npm@9.5.1 full-icu && \
	rm -rf /var/cache/apk/* /root/.npm /tmp/* && \
	# Install fonts
	apk --no-cache add --virtual fonts msttcorefonts-installer fontconfig && \
	update-ms-fonts && \
	fc-cache -f && \
	apk del fonts && \
	find  /usr/share/fonts/truetype/msttcorefonts/ -type l -exec unlink {} \; && \
	rm -rf /var/cache/apk/* /tmp/*

ENV NODE_ICU_DATA /usr/local/lib/node_modules/full-icu
EXPOSE 5678/tcp
USER root
 
RUN apk add --no-cache ffmpeg libreoffice
ENV DB_POSTGRESDB_SSL_CA=$(pwd)/ca.crt                                          
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_PORT=25060
ENV DB_POSTGRESDB_DATABASE=defaultdb
ENV DB_POSTGRESDB_SCHEMA=n8n
ENV DB_POSTGRESDB_USER=doadmin
ENV DB_POSTGRESDB_HOST=db-postgresql-tor1-39374-do-user-14763152-0.c.db.ondigitalocean.com
ENV DB_POSTGRESDB_PASSWORD=AVNS_O53gGN9n8BKM6aomD8Q
 