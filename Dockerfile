FROM ubuntu:16.04

# Set jenkins UID and GID from current environment
ARG JENKINS_UID
ARG JENKINS_GID
ENV USERNAME=test_user
ENV DATABASE=test_db

# Install system dependencies
RUN apt-get -y update
RUN apt-get -y install sudo vim

# Add user with jenkins UID and GID
RUN groupadd -g $JENKINS_GID $USERNAME
RUN useradd $USERNAME -u $JENKINS_UID -g $JENKINS_GID --shell /bin/bash --create-home

RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

CMD /bin/bash -l
