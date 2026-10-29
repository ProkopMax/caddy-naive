FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y ca-certificates curl xz-utils && \
    curl -L -o caddy-forwardproxy-naive.tar.xz https://github.com/klzgrad/forwardproxy/releases/download/v2.11.7-naive2/caddy-forwardproxy-naive.tar.xz && \
    tar -xJf caddy-forwardproxy-naive.tar.xz && \
    cp caddy-forwardproxy-naive/caddy /usr/local/bin/ && \
    rm -rf /var/lib/apt/lists/* *caddy-forwardproxy-naive*

EXPOSE 80 443

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
