FROM openjdk:11

RUN mkdir /config
RUN apt-get update && apt-get install -y jq

# Fetch the version string and set it as an environment variable to break cache
RUN echo $(wget -q -O - https://api.github.com/repos/jagrosh/MusicBot/releases/latest | jq -r '.tag_name') > /tmp/version.txt
ENV VERSION=$(cat /tmp/version.txt)

RUN wget -q -O - https://api.github.com/repos/jagrosh/MusicBot/releases/latest | jq -r '.assets[] | select(.name | contains("jar")) | .browser_download_url' | xargs wget -O JMusicBot.jar
VOLUME ["/config"]

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
