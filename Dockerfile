FROM node:16-alpine
WORKDIR /chat_client

COPY  ../chat_clientpackage.json ./chat_client
RUN npm install
RUN npm run build
COPY ./chat_client ./chat_client
EXPOSE 3000

CMD ["forever", "start", "./chat_client/build/index.html"]