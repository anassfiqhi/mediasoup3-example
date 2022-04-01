FROM node:17-alpine3.12
WORKDIR /usr/code
COPY ./code .
RUN apk add g++ make python3 linux-headers
RUN apk add --update py3-pip
#RUN npm install -g npm@8.5.5
RUN npm install
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"
# ENTRYPOINT ["tail", "-f", "/dev/null"]
# RUN apk add openssl
# RUN openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
# RUN mkdir -p server/ssl
# COPY key.pem server/ssl
# COPY cert.pem server/ssl
CMD [ "node", "app.js" ]