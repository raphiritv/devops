FROM oracle-jdk8

MAINTAINER John Bryan Sazon <john.bryan.j.sazon@accenture.com>

ARG IMAGE_VERSION

LABEL version=${IMAGE_VERSION}

EXPOSE 8080

ADD target/spring-petclinic-*.jar /spring-petclinic.jar

CMD ["java","-jar","/spring-petclinic.jar"]