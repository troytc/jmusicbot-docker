FROM openjdk:11

RUN mkdir /config
RUN wget https://github.com/jagrosh/MusicBot/releases/download/0.3.9/JMusicBot-0.3.9.jar

VOLUME ["/config"]

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot-0.3.9.jar"]
