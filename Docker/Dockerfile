FROM ubuntu:22.04

# Install core dependencies and tools
RUN apt-get update && apt-get install -y \
    curl tar gzip git sudo unzip bash gnupg \
    libicu-dev libkrb5-dev libssl-dev ca-certificates \
    && apt-get clean

# Install Terraform
ENV TERRAFORM_VERSION=1.9.7
RUN ARCH=$(uname -m | sed 's/aarch64/arm64/') && \
    curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip && \
    mv terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip

# Create runner user
RUN useradd -m runner
WORKDIR /home/runner

# Download GitHub Actions runner
ENV RUNNER_VERSION=2.313.0
ENV ARCH=arm64

RUN curl -L -o actions-runner.tar.gz https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${ARCH}-${RUNNER_VERSION}.tar.gz && \
    tar xzf actions-runner.tar.gz && \
    rm actions-runner.tar.gz && \
    chown -R runner:runner .

USER runner

