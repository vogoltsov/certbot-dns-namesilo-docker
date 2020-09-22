# certbot-dns-namesilo Docker image
Docker image for Certbot [DNS NameSilo plugin](https://github.com/mateste/certbot-dns-namesilo).

## Usage
### Create credentials
Using docker secrets is recommended to pass NameSilo API key to certbot.
```shell script
cat <<EOF | docker secret create certbot_dns_namesilo -
dns_namesilo_token=YOUR_API_TOKEN
EOF
```

### Run certbot
```shell script
docker run -it --rm \
    -v /etc/letsencrypt:/etc/lestencrypt \
    --secret certbot_dns_namesilo \
    vogoltsov/certbot-dns-namesilo \
    certonly \
    --authenticator dns-namesilo \
    --dns-namesilo-credentials /run/secrets/certbot_dns_namesilo \
    -d *.example.com -d example.com
```
