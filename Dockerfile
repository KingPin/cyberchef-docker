LABEL org.opencontainers.image.source https://github.com/KingPin/cyberchef-docker

FROM alpine:3.10

RUN apk -U --no-cache add \
            curl \
            git \
            python3 \
            npm \
            g++ \
            make \
            nodejs && \
    npm install npm@latest -g && \
    npm install -g grunt-cli http-server && \
    cd /root && \
    git clone https://github.com/gchq/cyberchef && \
    cd cyberchef && \
    npm install && \
    grunt prod && \
    mkdir -p /opt/cyberchef && \
    mv build/prod/* /opt/cyberchef && \
    cd / && \
    apk del --purge git \
                    npm && \
    rm -rf /root/* && \
    rm -rf /var/cache/apk/*

HEALTHCHECK --retries=10 CMD curl -s -XGET 'http://127.0.0.1:8000'

EXPOSE 8000/tcp
USER nobody:nobody
WORKDIR /opt/cyberchef
CMD ["http-server", "-p", "8000"]
