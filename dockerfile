# 빌드 스테이지
#버전별 수정이 필요하다.(확인!)
FROM maven:3.8.4-openjdk-11 as build  
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 실행 스테이지
# 버전별 수정이 필요하다.(확인!)
FROM openjdk:11-jdk-slim 
FROM tomcat:9.0

# target경로의 WAR파일 경로를 적어준다.(확인!)
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/recruit-app-0.0.1-SNAPSHOT.war ./recruit-app.war

EXPOSE 8080
EXPOSE 1521
EXPOSE 80
#CMD [ "catalina.sh","run" ]
CMD ["tail", "-f", "/dev/null"]