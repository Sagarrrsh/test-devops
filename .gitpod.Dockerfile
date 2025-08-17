FROM gitpod/workspace-full:latest

# Install Docker
USER root
RUN apt-get update && apt-get install -y \
    docker.io \
    docker-compose \
    ansible \
    openjdk-17-jdk \
    wget unzip gnupg software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip \
    && unzip terraform_1.9.8_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform_1.9.8_linux_amd64.zip

# Install Jenkins (will run on port 8080)
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - \
    && sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' \
    && apt-get update && apt-get install -y jenkins

USER gitpod
