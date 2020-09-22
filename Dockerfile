FROM certbot/certbot:latest

# Install the DNS plugin
RUN pip install --constraint /opt/certbot/docker_constraints.txt --no-cache-dir certbot-dns-namesilo
