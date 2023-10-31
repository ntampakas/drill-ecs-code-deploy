FROM node:19-slim
WORKDIR /usr/src/app
COPY package*.json ./
COPY index.js ./
RUN apt-get update ; apt-get install -y netcat-openbsd
RUN npm install express
RUN npm ci
COPY . .
EXPOSE 8000
CMD [ "node", "index.js" ]
