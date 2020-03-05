FROM tomcat

MAINTAINER sanbhandar

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

COPY target/*.war /usr/local/tomcat/webapps/myFirstApp.war

EXPOSE 8080
