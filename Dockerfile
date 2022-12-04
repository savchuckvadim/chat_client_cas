FROM node:16-alpine
WORKDIR /chat_client

COPY package.json ./chat_client
RUN npm install
RUN npm run build
COPY . .
EXPOSE 3000

CMD ["forever", "start", "./chat_client/build/index.html"]