FROM debian:stable-slim

ADD artalk-go.yml /opt/artalk/artalk-go.yml
ADD run.sh /opt/artalk/run.sh

RUN apt-get update \
    && apt-get install wget curl  -y

RUN wget -qO artalk.tar.gz https://github.com/aaro-n/file/blob/master/artalk/artalk-go.tar.gz
    
RUN tar -zxvf artalk.tar.gz -C /opt/artalk/
RUN chmod +x /opt/artalk/artalk-go \
    && chmod +x /opt/artalk/run.sh

CMD /opt/artalk/run.sh
