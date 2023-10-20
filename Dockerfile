FROM n8nio/n8n:1.10.0

USER root
 
RUN apk add --no-cache ffmpeg libreoffice
ENV DB_POSTGRESDB_SSL_CA=$(pwd)/ca.crt                                          
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_PORT=25060
ENV DB_POSTGRESDB_DATABASE=n8n
ENV DB_POSTGRESDB_SCHEMA=n8n
ENV DB_POSTGRESDB_USER=doadmin
ENV DB_POSTGRESDB_HOST=private-db-postgresql-tor1-39374-do-user-14763152-0.c.db.ondigitalocean.com
ENV DB_POSTGRESDB_PASSWORD=AVNS_O53gGN9n8BKM6aomD8Q
