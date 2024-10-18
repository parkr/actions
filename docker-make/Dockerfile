# Inspiration from https://github.com/actions/docker/blob/master/cli/Dockerfile
FROM docker:stable

RUN apk add --update --no-cache make bash jq curl && rm -rf /var/cache/apk/*

RUN curl --location https://github.com/sigstore/cosign/releases/download/v1.2.1/cosign-linux-amd64 > /usr/local/bin/cosign \
  && chmod +x /usr/local/bin/cosign \
  && cosign version

COPY --from=docker/buildx-bin:0.17.1 /buildx /usr/libexec/docker/cli-plugins/docker-buildx
RUN docker buildx version

COPY docker_tag_exists.sh /docker_tag_exists.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
