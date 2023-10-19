FROM n8nio/n8n:1.10.0

USER root

# Install new packages
RUN apk add --no-cache ffmpeg libreoffice


EXPOSE 5678

# Define the command to start n8n
CMD ["n8n"]