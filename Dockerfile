FROM maven:3-amazon-corretto-17 AS builder
#AS Builder means staging as builder first

COPY . /spc
#copying from current directory(i.e source) to destination /spc file in container 

RUN cd /spc && mvn package
#run cd command and run mvn package

FROM amazoncorretto:17-alpine-3.18-jdk
#alpine is an operating system amoung linux distributions beacuse of its thin OS

LABEL author="sulaiman" project="springpetclinic" environment="test"

ARG USERNAME="spring"
ARG HOMEDIR="/springpetclinic"
RUN adduser -h ${HOMEDIR} -s /bin/bash -D ${USERNAME}
#adding user with -h home directory then defining the shell bash and defining the username 

COPY --from=builder --chown=${USERNAME}:${USERNAME} /spc/target/spring-petclinic-*.jar ${HOMEDIR}

USER ${USERNAME}

WORKDIR ${HOMEDIR}

EXPOSE 8080

CMD ["sh","-c","java -jar springpetclinic-*.jar"]




