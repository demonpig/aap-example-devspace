ARG BASE_IMAGE=docker.io/redhat/ubi9:latest
FROM $BASE_IMAGE

LABEL ansible-execution-environment=true

ENV PIP_BREAK_SYSTEM_PACKAGES=1

# Installation
RUN /usr/bin/dnf install -y python3.11 python3.11-pip && \
    pip3.11 install 'ansible-core<2.17' ansible-dev-tools

# Directory / File Permissions
RUN mkdir -p /{.ansible,.ansible/roles,.ansible/collections,.ansible/modules} && touch /.ansible/.lock && \
    chgrp -R 0 /home && \
    chmod -R g=u /etc/passwd /etc/group /home /.ansible/.lock
