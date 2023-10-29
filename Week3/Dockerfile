FROM openjdk:11

ENV param_homework_due="2023년 10월 30일" \
    param_homework_name="Docker 과제" \
    param_name="임재욱"

RUN mkdir /app
WORKDIR /app

ADD ./build/libs/*.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
