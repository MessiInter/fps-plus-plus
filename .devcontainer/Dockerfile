# syntax=docker/dockerfile:1.6.0
# escape=\

FROM ubuntu:jammy

USER root

ARG WORKSPACE_DIR=/workspaces/workspace

WORKDIR $WORKSPACE_DIR

# Run the install script. Note that it's `bash -c` and not `bash -ci` now.
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    openjdk-21-jdk curl wget jq gnupg make sudo && \
    apt-get update

ARG GO_INSTALL_SCRIPT=https://gist.githubusercontent.com/eggbean/7f977f61327500c3f291ed36078b457f/raw/4d3681569658834cb3a6344ff69358db974a553e/install_golang.sh

RUN curl -fsSL $GO_INSTALL_SCRIPT | bash -

ENV PATH=/usr/local/go/bin:/root/go/bin:$WORKSPACE_DIR/bin:$PATH

RUN go install github.com/packwiz/packwiz@latest && \
    go install github.com/Merith-TK/packwiz-wrapper/cmd/pw@main && \
    echo "Packwiz has been Updated"