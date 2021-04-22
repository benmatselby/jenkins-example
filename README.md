# Jenkins Examples

[![Build Status](https://www.travis-ci.com/benmatselby/jenkins-example.svg?branch=main)](https://www.travis-ci.com/benmatselby/jenkins-example)

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
  --name jenkins-primary \
  jenkins/jenkins:lts
```

## Running the agent

We want to build the Jenkins agents, so:

```shell
make build
```

This will create you a Docker image called `agents/go`.

You now require the `<secret>` and `<agent-name>` from the Jenkins agent configuration screen. Again, see the blog post.

```shell
docker run --rm \
  -eJENKINS_SECRET=<secret> \
  -eJENKINS_URL=http://jenkins-primary:8080 \
  -eJENKINS_AGENT_NAME=<agent-name> \
  --network jenkins \
  --init \
  -it \
  agents/go
```
