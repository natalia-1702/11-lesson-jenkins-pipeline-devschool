FROM ubuntu:18.04
RUN mkdir /opt/tomcat/
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y default-jdk
RUN apt-get install -y curl
WORKDIR /opt/tomcat
RUN curl -O http://mirror.linux-ia64.org/apache/tomcat/tomcat-8/v8.5.56/bin/apache-tomcat-8.5.56.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.56/* /opt/tomcat/.
RUN cp /tmp/*.war /opt/tomcat/webapps/
WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
