FROM zenika/alpine-chrome:with-chromedriver

USER root
RUN  apk update \
  && apk upgrade \
  && apk add --update openjdk17 tzdata curl unzip bash \
  && rm -rf /var/cache/apk/*

# Load the version variable into the environment
RUN wget -q "https://github.com/arif-banai/MusicBot/releases/download/v0.5.2/JMusicBot-0.5.2.jar" -O JMusicBot.jar

RUN adduser -S music
USER music

ENTRYPOINT ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]


