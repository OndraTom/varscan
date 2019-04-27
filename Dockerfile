FROM openjdk:12-alpine

RUN apk add --update bash gcc musl-dev

WORKDIR /app

RUN wget https://github.com/dkoboldt/varscan/raw/master/VarScan.v2.4.3.jar

ADD run.sh /app/run.sh

RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]