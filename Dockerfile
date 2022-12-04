FROM node:16-alpine
WORKDIR /front/chat_client

COPY package.json .
RUN npm install
RUN npm run build
COPY . .
EXPOSE 3000

CMD ["forever", "start", "./chat_client/build/index.html"]