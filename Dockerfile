FROM ubuntu:16.04

# Update package cache
RUN apt-get -y update

# Install project dependencies
RUN apt-get -y install python3 python3-pip virtualenv

ENTRYPOINT ["/bin/bash", "-l"]
