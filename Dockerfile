FROM ubuntu:20.04

RUN apt update -y
RUN apt install curl wget unzip -y

RUN wget -P /go-ethereum https://github.com/openethereum/openethereum/releases/download$(curl -s -L https://github.com/openethereum/openethereum/releases/latest | egrep -m 1 -o '/v([0-9+].[0-9+].[0-9+])/openethereum-linux-v([0-9+].[0-9+].[0-9+]).zip')
RUN unzip -o $(ls | egrep -o 'openethereum-linux-(.*)zip') -d /usr/local/bin
RUN rm -rf $(ls | egrep -o 'openethereum-linux-(.*)zip')

ENTRYPOINT [ "/usr/local/bin/openethereum" ]