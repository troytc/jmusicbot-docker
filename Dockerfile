FROM zenika/alpine-chrome:with-chromedriver

USER root
RUN  apk update \
  && apk upgrade \
  && apk add --update openjdk11 tzdata curl unzip bash \
  && rm -rf /var/cache/apk/*

# Load the version variable into the environment
RUN wget -q "https://github.com/kaydol/MusicBot_fix_yt_for_docker/releases/download/fix-youtube/JMusicBot-Snapshot-All.jar" -O JMusicBot.jar

RUN adduser -S music
USER music

ENTRYPOINT ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
