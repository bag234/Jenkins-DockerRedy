FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update && \
    apt-get install -y docker-cli \ 
    groupadd -g 109 docker \
    usermod -aG docker jenkins

USER jenkins