FROM minio/minio:RELEASE.2023-11-01T01-57-10Z-cpuv1

# Create data directory for the user, where we will keep the data
RUN mkdir -p /home/dokku/data

# Add custom nginx.conf template for Dokku to use
WORKDIR /app
ADD nginx.conf.sigil .

CMD ["minio", "server", "/home/dokku/data", "--console-address", ":9001"]
