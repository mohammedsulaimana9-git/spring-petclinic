FROM maven:3.8.3-openjdk-17

LABEL author="sulaiman" project="spring-petclinic"

ARG USER="spring"
ARG HOMEDIR="/spring"

RUN useradd -m -d ${HOMEDIR} -s /bin/bash ${USER}
# -m Create the user’s home directory
# -d Sets the home directory path for the user

USER ${USER}


WORKDIR /petclinic

COPY . .

RUN mvn package

EXPOSE 8080

CMD ["sh","-c","java -jar target/*.jar"]





