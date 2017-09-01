FROM ubuntu:17.04
MAINTAINER shun

ENV LSB_RELEASE zesty

# basic packages
RUN : \
 && set -x \
 && apt-get update \
 && apt-get install -y \
      bash-completion \
      curl \
      git \
      language-pack-ja \
      language-pack-ja-base \
      man \
      manpages-dev \
      silversearcher-ag \
      software-properties-common \
      sudo \
      tmux \
      zsh \
 && apt-get clean \
 && :

# docker
RUN : \
 && set -x \
 && apt-get install -y \
      apt-transport-https \
      ca-certificates \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $LSB_RELEASE stable" \
 && apt-get update \
 && apt-get install -y \
      docker-ce \
 && apt-get clean \
 && :

# install nvim
RUN : \
 && set -x \
 && add-apt-repository ppa:neovim-ppa/unstable \
 && apt-get update \
 && apt-get install -y \
      neovim \
      python3-pip \
 && apt-get clean \
 && pip3 install neovim \
 && :

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/zsh"]
