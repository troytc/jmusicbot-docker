FROM zenika/alpine-chrome:with-chromedriver

USER root

RUN  apk update \
  && apk upgrade \
  && apk add --update openjdk11 tzdata curl unzip bash \
  && rm -rf /var/cache/apk/*

# Load the version variable into the environment
RUN wget -q "https://cdn.discordapp.com/attachments/185037029384388608/1354532723049627649/JMusicBot-cd40e2e5-potoken-iprotation.jar?ex=67e996e7&is=67e84567&hm=71a1014068c48a1a6ac5a5bc2f9154b1ec9d4cbb09c18ecceb46906ca1836d19&" -O JMusicBot.jar

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
