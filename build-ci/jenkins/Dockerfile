FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
apt-get update 
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
RUN wget -O /opt/udclient.zip http://40.127.104.208:8080/tools/udclient.zip --no-check-certificate && \
    unzip /opt/udclient.zip -d /opt/udclient && \
    chown -R jenkins:jenkins /opt && chmod +x /opt/udclient/udclient/udclient

USER jenkins
EXPOSE 8080
ENV JENKINS_OPTS --prefix=/jenkins

