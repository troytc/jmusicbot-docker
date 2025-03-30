FROM openjdk:11

RUN mkdir /config
RUN apt-get update -qq -y && apt-get install -y wget xvfb unzip libasound2 libatk-bridge2.0.0 libnss3 xdg-utils

RUN wget -q -O chrome-linux64.zip "https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.165/linux64/chrome-linux64.zip"
RUN wget -q -O chromedriver-linux64.zip "https://storage.googleapis.com/chrome-for-testing-public/134.0.6998.165/linux64/chromedriver-linux64.zip"
RUN unzip chrome-linux64.zip && rm chrome-linux64.zip
RUN mv chrome-linux64 /opt/chrome/ && ln -s /opt/chrome/chrome /usr/local/bin/
RUN unzip -j chromedriver-linux64.zip chromedriver-linux64/chromedriver && rm chromedriver-linux64.zip
RUN mv chromedriver /usr/local/bin/

# Load the version variable into the environment
RUN wget -q "https://cdn.discordapp.com/attachments/185037029384388608/1354532723049627649/JMusicBot-cd40e2e5-potoken-iprotation.jar?ex=67e996e7&is=67e84567&hm=71a1014068c48a1a6ac5a5bc2f9154b1ec9d4cbb09c18ecceb46906ca1836d19&" -O JMusicBot.jar

CMD ["java", "-Dconfig=/config/config.txt", "-Dnogui=true", "-jar", "JMusicBot.jar"]
