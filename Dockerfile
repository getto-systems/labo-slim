FROM docker:latest
MAINTAINER shun

RUN : && \
  apk add --update \
    curl \
    git \
    less \
    grep \
    sudo \
    shadow \
    tzdata \
    tmux \
    bash \
    zsh \
    perl \
    neovim \
    the_silver_searcher \
    python3 \
    py3-pip \
    gcc \
    python3-dev \
    musl-dev \
  && \
  pip3 install neovim && \
  apk del \
    py3-pip \
    gcc \
    python3-dev \
    musl-dev \
  && \
  rm -rf /var/cache/apk/* && \
  addgroup -S sudo && \
  echo '%sudo	ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers && \
  :

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/zsh"]
