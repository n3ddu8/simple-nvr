FROM mcr.microsoft.com/devcontainers/javascript-node

WORKDIR /opt/app

COPY simple-nvr/package*.json ./

# Install OS and npm dependencies
RUN apt update && \
    apt install -y ffmpeg && \
    npm install -g npm@latest pm2 && \
    npm install

COPY simple-nvr ./

EXPOSE 3000

CMD ["pm2-runtime", "start", "nvr-browser.js", "--name", "nvr"]
