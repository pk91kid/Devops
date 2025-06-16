FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl tar gzip git sudo \
    libicu-dev libkrb5-dev libssl-dev \
    ca-certificates && \
    apt-get clean

# Create runner user
RUN useradd -m runner
WORKDIR /home/runner

# Download GitHub runner
ENV RUNNER_VERSION=2.313.0
ENV ARCH=arm64

RUN curl -L -o actions-runner.tar.gz https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${ARCH}-${RUNNER_VERSION}.tar.gz && \
    tar xzf actions-runner.tar.gz && \
    rm actions-runner.tar.gz && \
    chown -R runner:runner .

USER runner
