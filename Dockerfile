FROM jenkins/jenkins:lts-jdk21

USER root

RUN apt-get update && \
    apt-get install -y docker-cli maven && \ 
    groupadd -g 109 docker && \
    usermod -aG docker jenkins

USER jenkins
# Добаляет ключи для подключения ssh git
RUN mkdir -p ~/.ssh/known_hosts && ssh-keyscan github.com >> ~/.ssh/known_hosts