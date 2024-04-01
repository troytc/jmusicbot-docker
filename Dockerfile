FROM openjdk:11

RUN mkdir /config
RUN wget -O JMusicBot.jar $(wget -q -O - https://api.github.com/repos/jagrosh/MusicBot/releases/latest  |  jq -r '.assets[] | select(.name | contains ("jar")) | .browser_download_url')
VOLUME ["/config"]

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
