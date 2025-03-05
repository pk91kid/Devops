FROM jenkins/jenkins:lts

USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*
RUN python3 -m venv /venv
RUN /venv/bin/pip install python-jenkins
USER jenkins
ENV PATH="/venv/bin:$PATH"

