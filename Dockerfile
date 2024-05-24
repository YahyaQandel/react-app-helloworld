FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY public ./public
COPY src ./src

RUN npm run build

RUN npm install -g serve

CMD ["serve", "-s", "build", "-l", "8080"]

EXPOSE 8080
