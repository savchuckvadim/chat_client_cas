FROM node:16-alpine
WORKDIR /chat_client


# RUN sudo dnf install git-all
RUN apk add git
RUN git clone https://github.com/savchuckvadim/chat_client
# COPY  ./chat_client/package.json ./chat_client
RUN npm install
RUN npm run build
COPY ./chat_client ./chat_client
EXPOSE 3000

CMD ["forever", "start", "./chat_client/build/index.html"]