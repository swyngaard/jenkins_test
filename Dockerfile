FROM ubuntu:16.04

# Set jenkins UID and GID from current environment
ENV JENKINS_UID=111
ENV JENKINS_GID=118

# Install dependencies
RUN apt-get -y update
RUN apt-get -y install adduser sudo

#Add user with jenkins UID and GID
RUN ["/bin/bash", "-c", "groupadd -g $JENKINS_GID jenkins"]
RUN ["/bin/bash", "-c", "adduser --disabled-password --uid $JENKINS_UID --gid $JENKINS_GID --gecos \"Jenkins User\" jenkins"]
RUN ["/bin/bash", "-c", "echo \"jenkins:jsecure1842\" | chpasswd"]

# Grant user sudo privileges without password prompt
RUN ["/bin/bash", "-c", "echo \"jenkins ALL=NOPASSWD: ALL\" | (EDITOR=\"tee -a\" visudo)"]
