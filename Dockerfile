FROM n8nio/n8n:1.10.0

USER root

# Install new packages
RUN apk add --no-cache ffmpeg libreoffice