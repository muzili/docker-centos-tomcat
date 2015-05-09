FROM muzili/centos-base
MAINTAINER Joshua Lee <muzili@gmail.com>

# UPDATE
RUN yum -y update && \
    yum -y install wget tar java-1.7.0-openjdk && \
    yum -y install ctags

# TOMCAT version
ENV TOMCAT_VERSION 7.0.61

# INSTALL TOMCAT
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/catalina.tar.gz \
    && tar xzf /tmp/catalina.tar.gz -C /opt \
    && ln -s /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat \
    && rm /tmp/catalina.tar.gz

# REMOVE APPS
RUN rm -rf /opt/tomcat/webapps/examples /opt/tomcat/webapps/docs

# SET CATALINE_HOME and PATH
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

# SET PORT and start TOMCAT
EXPOSE 8080
CMD $CATALINA_HOME/bin/catalina.sh run
