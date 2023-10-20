FROM n8nio/n8n:1.10.0

USER root

# Install new packages
RUN apk add --no-cache ffmpeg libreoffice

# Expose port (if needed)
EXPOSE 5678

# Start n8n
CMD ["n8n"]