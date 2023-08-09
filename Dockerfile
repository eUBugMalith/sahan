FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  libnss3 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
