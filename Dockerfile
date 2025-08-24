FROM mcr.microsoft.com/devcontainers/javascript-node

RUN apt update && \
    apt install ffmpeg -y && \
    npm install -g npm@latest && \
    npm install -g pm2

WORKDIR /opt/app

COPY simple-nvr .

EXPOSE 3000

CMD ["pm2-runtime", "start", "nvr-browser.js", "--name", "nvr"]
