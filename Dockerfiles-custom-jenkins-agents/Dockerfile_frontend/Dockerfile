FROM jenkins/inbound-agent:latest
USER root

# Installer Node.js et Jest
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g jest

USER jenkins
