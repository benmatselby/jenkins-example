# Base Dockerfile image: https://hub.docker.com/r/jenkins/inbound-agent/dockerfile
FROM jenkins/inbound-agent:4.7-1-jdk11

# Where we are going to install Go.
ENV GO_INSTALL_PATH /home/jenkins/go

# We need to add the GO_INSTALL_PATH to the PATH so `go` works.
ENV PATH /home/jenkins/bin:${GO_INSTALL_PATH}/bin:/usr/local/go/bin:$PATH

# The version of Go we want to install
ENV GO_VERSION 1.16

# Define the GOPATH
ENV GOPATH ${GO_INSTALL_PATH}

# CI/CD platforms normally define CI=true, so let's follow suit
ENV CI true

# Install go.
RUN curl -sL https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz > /tmp/go.tar.gz && \
  tar -C /tmp -xf /tmp/go.tar.gz && \
  mv /tmp/go ${GO_INSTALL_PATH} && \
  rm -rf \
    ${GO_INSTALL_PATH}/pkg/*/cmd \
    ${GO_INSTALL_PATH}/pkg/bootstrap \
    ${GO_INSTALL_PATH}/pkg/obj \
    ${GO_INSTALL_PATH}/pkg/tool/*/api \
    ${GO_INSTALL_PATH}/pkg/tool/*/go_bootstrap \
    ${GO_INSTALL_PATH}/src/cmd/dist/dist \
    /tmp/go.tag.gz
