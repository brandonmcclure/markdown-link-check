FROM node:alpine

# Use the Open Container Image Annotation Spec (https://github.com/opencontainers/image-spec/blob/master/annotations.md)
LABEL org.opencontainers.image.title="markdown-link-check"
LABEL org.opencontainers.image.description="checks that all hyperlinks in a markdown text to determine if they are alive or dead"
LABEL org.opencontainers.image.documentation="https://github.com/tcort/markdown-link-check/blob/master/README.md"
LABEL org.opencontainers.image.source="https://github.com/tcort/markdown-link-check"

# Install app dependencies
COPY package*.json /src/
WORKDIR /src
RUN set -ex; \
    npm install
# Bundle app source
COPY . /src
RUN npm test

ENTRYPOINT [ "node", "/src/markdown-link-check" ]
