FROM zenika/alpine-chrome:with-chromedriver

USER root
RUN  apk update \
  && apk upgrade \
  && apk add --update openjdk11 tzdata curl unzip bash \
  && rm -rf /var/cache/apk/*

# Load the version variable into the environment
RUN wget -q "https://cdn.discordapp.com/attachments/185037029384388608/1368619713323733052/JMusicBot-bb8b725d-potoken-iprotation.jar?ex=685d6fef&is=685c1e6f&hm=86a7d16cf4a28c32038d6eb11f847c0e33343d91e6d33f9120189ae3e9ed77ce&" -O JMusicBot.jar

RUN adduser -S music
USER music

ENTRYPOINT ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
