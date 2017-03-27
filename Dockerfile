FROM ubuntu:16.04

# Set jenkins UID and GID from current environment
ENV JENKINS_UID=111
ENV JENKINS_GID=118
ENV USERNAME=test_user
ENV DATABASE=test_db

# Install system dependencies
RUN apt-get -y update
RUN apt-get -y install sudo vim

# Install project dependencies
RUN apt-get -y install openssh-server postgresql postgresql-client python3-psycopg2

# Add user with jenkins UID and GID
RUN groupadd -g $JENKINS_GID $USERNAME
RUN useradd $USERNAME -u $JENKINS_UID -g $JENKINS_GID --shell /bin/bash --create-home

RUN echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers

CMD /bin/bash -l
