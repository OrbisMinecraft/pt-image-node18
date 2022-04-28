FROM node:18-alpine 
LABEL author="Luis Michaelis"

LABEL \
    org.opencontainers.image.url='https://github.com/OrbisMinecraft/pt-image-node18' \
    org.opencontainers.image.source='https://github.com/OrbisMinecraft/pt-image-node18/tree/main' \
    org.opencontainers.image.title='A Node 18 image for Pterodactyl' \
    org.opencontainers.image.authors='Luis Michaelis <lmichaelis.all+dev@gmail.com>' \
    org.opencontainers.image.description='A Node 18 image for Pterodactyl'
    

RUN addgroup -S container && adduser -S container -S container

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

CMD ["/bin/sh", "/entrypoint.sh"]
