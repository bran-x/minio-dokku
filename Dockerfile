FROM minio/minio:RELEASE.2021-10-07T01-07-50Z

# Install sudo package
RUN apt-get update && apt-get install -y sudo

# Add user dokku with an individual UID
RUN useradd -u 32769 -m -s /bin/bash dokku
USER dokku

# Create data directory for the user, where we will keep the data
RUN mkdir -p /home/dokku/data

# Add custom nginx.conf template for Dokku to use
WORKDIR /app
ADD nginx.conf.sigil .

CMD ["minio", "server", "/home/dokku/data", "--console-address", ":9001"]
