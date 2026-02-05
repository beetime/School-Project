FROM jenkins/jenkins:lts

USER root

RUN apt-get update || true \
    && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-get update \
    && apt-get install -y git

USER jenkins
