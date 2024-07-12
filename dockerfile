# 빌드 스테이지
#버전별 수정이 필요하다.(확인!)
FROM maven:3.8.4-openjdk-17 as build  
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 실행 스테이지
# 버전별 수정이 필요하다.(확인!)
FROM openjdk:17-jdk-slim 
# target경로의 WAR파일 경로를 적어준다.(확인!)
COPY --from=build /app/target/simple-web-app.war /app.war 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.war"]