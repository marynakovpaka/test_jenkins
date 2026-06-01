FROM jenkins/jenkins:lts

USER root

# Install the Docker CLI inside the Jenkins image so the pipeline can run
# `docker` against the host daemon (mounted via /var/run/docker.sock).
RUN apt-get update \
    && apt-get install -y --no-install-recommends docker.io \
    && rm -rf /var/lib/apt/lists/*
