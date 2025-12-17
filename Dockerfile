FROM maven:3.8.3-openjdk-17

LABEL author="sulaiman" project="spring-petclinic"

WORKDIR /petclinic

COPY . .

RUN mvn package

EXPOSE 8080

CMD ["sh","-c","java -jar target/*.jar"]