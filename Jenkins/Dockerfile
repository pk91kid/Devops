FROM jenkins/jenkins:lts

# Install Python 3 and pip
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins

