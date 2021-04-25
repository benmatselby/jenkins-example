# Jenkins Examples

[![CI](https://github.com/benmatselby/jenkins-example/actions/workflows/ci.yml/badge.svg)](https://github.com/benmatselby/jenkins-example/actions/workflows/ci.yml)

This repo houses some of the content from [these blog posts](https://dev.to/benmatselby/getting-started-with-jenkins-3a81). For a detailed explanation and a step by step guide, please follow the instructions in the blog posts.

For "cutting to the chase", follow the sections below

## Running the controller

This will create us a network, and run the Jenkins Controller.

```shell
docker network create jenkins
docker run \
  --rm \
  -p 8080:8080 \
  --network jenkins \
  -v "${HOME}/.jenkins:/var/jenkins_home" \
  --name jenkins-controller \
  jenkins/jenkins:lts
```

## Running the agent

We want to build the Jenkins agents, so:

```shell
make build
```

This will create you a Docker image called `jenkins-agent:go`.

You now require the `<secret>` and `<agent-name>` from the Jenkins agent configuration screen. Again, see the blog post.

```shell
export JENKINS_SECRET=<secret>
export JENKINS_AGENT_NAME=<agent_name>
docker run --rm \
  -eJENKINS_SECRET \
  -eJENKINS_URL=http://jenkins-controller:8080 \
  -eJENKINS_AGENT_NAME \
  --network jenkins \
  --init \
  -it \
  jenkins-agent:go
```
