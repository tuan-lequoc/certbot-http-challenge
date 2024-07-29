# Require:
 - etcd

# First set up
## Create directory
mkdir -p data/certbot/conf data/certbot/www nginx/self-signed

## self-gen certificate (optional).
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/docker/proxy/nginx/self-signed/selfsigned.key -out ~/docker/proxy/nginx/self-signed/selfsigned.crt -subj "/CN=localhost"

# Source environment variables
. ./populate_env.sh