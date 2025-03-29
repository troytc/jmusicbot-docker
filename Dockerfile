FROM markhobson/maven-chrome:jdk-11

RUN mkdir /config
RUN apt-get update && apt-get install -y jq

# Load the version variable into the environment
RUN wget -q "https://cdn.discordapp.com/attachments/185037029384388608/1354532723049627649/JMusicBot-cd40e2e5-potoken-iprotation.jar?ex=67e996e7&is=67e84567&hm=71a1014068c48a1a6ac5a5bc2f9154b1ec9d4cbb09c18ecceb46906ca1836d19&" -O JMusicBot.jar

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
