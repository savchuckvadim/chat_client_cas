FROM node:16-alpine
WORKDIR /chat


# RUN sudo dnf install git-all
RUN apk update && apk upgrade && apk add bash
RUN apk add git
RUN apk update 
RUN apk git clone https://github.com/savchuckvadim/chat_client
# COPY  ./chat_client/package.json ./chat_client
COPY . ./chat
#
RUN apk cd ./chat/chat_client
RUN apk npm install
RUN apk npm run build

EXPOSE 3000

CMD ["forever", "start", "./chat_client/build/index.html"]