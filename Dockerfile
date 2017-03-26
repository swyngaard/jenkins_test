FROM ubuntu:16.04

# Set jenkins UID and GID from current environment
ENV JENKINS_UID=111
ENV JENKINS_GID=118
ENV USERNAME=test_user
ENV DATABASE=test_db

# Install system dependencies
RUN apt-get -y update
RUN apt-get -y install netcat-openbsd net-tools

# If host is running squid-deb-proxy on port 8000, populate /etc/apt/apt.conf.d/30proxy
# By default, squid-deb-proxy 403s unknown sources, so apt shouldn't proxy ppa.launchpad.net
RUN route -n | awk '/^0.0.0.0/ {print $2}' > /tmp/host_ip.txt
RUN echo "HEAD /" | nc `cat /tmp/host_ip.txt` 8000 | grep squid-deb-proxy \
  && (echo "Acquire::http::Proxy \"http://$(cat /tmp/host_ip.txt):8000\";" > /etc/apt/apt.conf.d/30proxy) \
  && (echo "Acquire::http::Proxy::ppa.launchpad.net DIRECT;" >> /etc/apt/apt.conf.d/30proxy) \
  || echo "No squid-deb-proxy detected on docker host"

# Install project dependencies
#RUN apt-get -y install postgresql postgresql-client python3-psycopg2
RUN apt-get -y install sudo openssh-server

# Add user with jenkins UID and GID
RUN ["/bin/bash", "-c", "groupadd -g $JENKINS_GID $USERNAME"]
RUN ["/bin/bash", "-c", "adduser --disabled-password --uid $JENKINS_UID --gid $JENKINS_GID --gecos 'Test User' $USERNAME"]
RUN ["/bin/bash", "-c", "echo \"$USERNAME:ndsecure1842\" | chpasswd"]

RUN ["/bin/bash", "-c", "echo \"$USERNAME ALL=(ALL) NOPASSWD: ALL\" | (EDITOR=\"tee -a\" visudo)"]

# Helper scripts
#ADD init_db.sh entrypoint.sh /tmp/

# Create and initialize the database
#RUN /tmp/init_db.sh

#VOLUME ["/var/lib/postgresql"]

#CMD /tmp/entrypoint.sh && /bin/bash -l
CMD /bin/bash -l
