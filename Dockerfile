FROM n8nio/n8n:1.10.0 

RUN if [ -z "$N8N_VERSION" ] ; then echo "The N8N_VERSION argument is missing!" ; exit 1; fi

# Update everything and install needed dependencies
RUN apk add --update graphicsmagick tzdata

# # Set a custom user to not have n8n run as root
USER root

# Install n8n and the also temporary all the packages
# it needs to build it correctly.
RUN apk --update add --virtual build-dependencies python build-base ca-certificates && \
	npm_config_user=root npm install -g n8n@${N8N_VERSION} && \
	apk del build-dependencies

WORKDIR /data

CMD ["n8n"]
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
 