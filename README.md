YOUR_BRIDGE_PASSWORD openssl rand -base64 24
YOUR_EXIT_DOMAIN example.com

docker compose up -d --build

docker logs caddy-naive --tail 20
curl -sI https://YOUR_EXIT_DOMAIN | head -3
