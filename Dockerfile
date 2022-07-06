FROM debian

RUN apt-get update && apt-get -y install \
      exa \
      fd-find \
      fzf \
      git \
      iproute2 \
      net-tools \
      procps \
      python3 python3-pip \
      tree \
      unzip \
      wget \
      zsh \
      && rm -rf /var/lib/apt/lists/*

# packages
COPY install.sh .
RUN ./install.sh && rm install.sh

# antigen
RUN wget "https://git.io/antigen" -O /root/.antigen.zsh
COPY .zshrc /root
COPY .p10k.zsh /root
RUN /bin/zsh /root/.zshrc
RUN mkdir /root/.antigen/bundles/robbyrussell/oh-my-zsh/cache/completions
RUN /root/.antigen/bundles/romkatv/powerlevel10k/gitstatus/install

# colors
ENV TERM=xterm-256color

RUN chsh -s /bin/zsh root
