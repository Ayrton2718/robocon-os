FROM ubuntu:22.04

COPY ansible/ /tmp/ansible/

RUN apt update \
  && DEBIAN_FRONTEND=noninteractive apt install \
  -y --no-install-recommends \
  ansible \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN ansible-playbook /tmp/ansible/docker.yml \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*
