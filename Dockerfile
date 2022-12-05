FROM node:16-alpine
WORKDIR /chat


# RUN sudo dnf install git-all
RUN apk add git
RUN git clone https://github.com/savchuckvadim/chat_client
# COPY  ./chat_client/package.json ./chat_client
COPY ./chat_client .
RUN cd ./chat_client
RUN npm install
RUN npm run build

EXPOSE 3000

CMD ["forever", "start", "./chat_client/build/index.html"]