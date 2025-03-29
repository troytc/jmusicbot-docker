FROM openjdk:11

RUN mkdir /config
RUN apt-get update && apt-get install -y jq

# Fetch the version string and set it as an environment variable
RUN VERSION=$(wget -q -O - https://api.github.com/repos/jagrosh/MusicBot/releases/latest | jq -r '.tag_name') && \
    echo "VERSION=$VERSION" > /tmp/version.env

# Load the version variable into the environment
RUN . /tmp/version.env && \
    wget -q -O - https://cdn.discordapp.com/attachments/185037029384388608/1354532723049627649/JMusicBot-cd40e2e5-potoken-iprotation.jar -O JMusicBot.jar

# Use ARG to make the version available at build time
ARG VERSION
ENV VERSION=$VERSION

VOLUME ["/config"]

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
