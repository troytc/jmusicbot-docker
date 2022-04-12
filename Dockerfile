FROM openjdk:11

RUN mkdir /config
RUN wget https://github.com/jagrosh/MusicBot/releases/download/0.3.8/JMusicBot-0.3.8.jar

VOLUME ["/config"]

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot-0.3.8.jar"]
