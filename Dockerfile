FROM centos:7

MAINTAINER devops@outlook.com

RUN mkdir /opt/tomcat/
#RUN yum install wget
WORKDIR /opt/tomcat/
#RUN curl -O http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.
COPY  apache-tomcat-8.5.51  /opt/tomcat/apache-tomcat-8.5.51

RUN  pwd
RUN ls
RUN cd apache-tomcat-8.5.51/
RUN chmod +x *
#RUN tar xvfz apache*.tar.gz
#RUN mv apache-tomcat-8.5.45/* /opt/tomcat/.
RUN yum install java-1.8.0-openjdk-devel -y
RUN java -version
COPY ./target/roshambo.war /opt/tomcat/webapps/
RUN chmod a+rx /opt /opt/tomcat/ /opt/tomcat/apache-tomcat-8.5.51/bin/

WORKDIR /opt/tomcat/webapps
RUN ls 

EXPOSE 8080

CMD ["/opt/tomcat/apache-tomcat-8.5.51/bin/catalina.sh", "run"]
