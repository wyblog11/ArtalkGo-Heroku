FROM debian:stable-slim

ADD artalk-go.yml /root/artalk/artalk-go.yml
ADD run.sh /root/artalk/run.sh

RUN apt-get update \
    && apt-get install wget curl  -y

RUN wget -qO artalk.tar.gz https://github.com/aaro-n/file/raw/master/artalk/artalk.tar.gz
    
RUN tar -zxvf artalk.tar.gz -C /root/artalk
RUN chmod +x /root/artalk/artalk-go \
    && chmod +x /root/artalk/run.sh

CMD /root/artalk/run.sh
