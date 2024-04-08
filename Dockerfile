FROM openjdk:11

RUN mkdir /config
RUN apt-get update && apt-get install -y jq
RUN wget -q -O - https://api.github.com/repos/jagrosh/MusicBot/releases/latest | jq -r '.assets[] | select(.name | contains("jar")) | .browser_download_url' | xargs wget -O JMusicBot.jar
VOLUME ["/config"]

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
