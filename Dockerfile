##############
# Base Image #
##############

FROM rtvu/docker-ubuntu:24.04

#########################
# Environment Variables #
#########################

ENV ASDF_VERSION=v0.14.0
ENV ERLANG_VERSION=27.0.1
ENV ELIXIR_VERSION=1.17.2-otp-27

################
# Install asdf #
################

RUN \
  sudo apt update && \
  sudo DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends \
    curl \
    git \
    && \
  sudo rm -rf /var/lib/apt/lists/* && \
  git clone https://github.com/asdf-vm/asdf.git ${HOME}/.asdf --branch ${ASDF_VERSION} && \
  echo "" >> ${HOME}/.bashrc && \
  echo '. "$HOME/.asdf/asdf.sh"' >> ${HOME}/.bashrc && \
  echo '. "$HOME/.asdf/completions/asdf.bash"' >> ${HOME}/.bashrc

##################
# Install Erlang #
##################

RUN \
  sudo apt update && \
  sudo DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends \
    autoconf \
    build-essential \
    fop \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libncurses-dev \
    libncurses5-dev \
    libpng-dev \
    libssh-dev \
    libwxgtk-webview3.2-dev \
    libwxgtk3.2-dev \
    libxml2-utils \
    m4 \
    openjdk-11-jdk \
    unixodbc-dev \
    xsltproc \
    && \
  sudo rm -rf /var/lib/apt/lists/* && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git' && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && asdf install erlang $ERLANG_VERSION' && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && asdf global erlang $ERLANG_VERSION'

##################
# Install Elixir #
##################

RUN \
  sudo apt update && \
  sudo DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends \
    unzip \
    && \
  sudo rm -rf /var/lib/apt/lists/* && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git' && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && asdf install elixir $ELIXIR_VERSION' && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && asdf global elixir $ELIXIR_VERSION' && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && mix local.hex' && \
  /bin/bash -c '. $HOME/.asdf/asdf.sh && mix local.rebar'

###########
# Startup #
###########

CMD ["/bin/bash"]
