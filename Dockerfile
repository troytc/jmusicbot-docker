FROM openjdk:11

RUN wget https://github.com/jagrosh/MusicBot/releases/download/0.3.6/JMusicBot-0.3.6.jar

CMD ["java", "-Dnogui=true", "-jar", "JMusicBot-0.3.6.jar"]