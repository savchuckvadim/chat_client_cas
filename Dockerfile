FROM node:19-alpine
WORKDIR /chat


# RUN sudo dnf install git-all
RUN apk update && apk upgrade && apk add bash
RUN apk add git
RUN apk update 
RUN git clone https://github.com/savchuckvadim/chat_client .
# COPY  ./chat_client/package.json ./chat_client
COPY ./chat_client ./chat
#
# RUN cd ./chat_client
RUN npm install npm@9.1.3 svgo@2.0.0
# RUN npm install svgo@2.0.0
RUN npm install forever -g
RUN npm install
RUN npm run build

EXPOSE 3000

CMD ["forever", "start", "./chat_client/build/index.html"]