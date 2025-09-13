FROM mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm

ARG HUGO_VERSION=0.150.0
ENV HUGO_DEB_FILE=hugo_extended_${HUGO_VERSION}_linux-amd64.deb

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_DEB_FILE}
RUN dpkg -i ${HUGO_DEB_FILE}
