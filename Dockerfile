FROM jenkins/jenkins:lts

USER root


RUN apt-get update -o Acquire::AllowInsecureRepositories=true \
    && apt-get install -y git -o Acquire::AllowInsecureRepositories=true

USER jenkins