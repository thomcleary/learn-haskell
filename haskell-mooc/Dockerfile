FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install unminimize && \
    (echo "y"; echo "y") | unminimize


### Tools
RUN apt-get update && \
    apt-get -y install curl fish bat less


### Starship
# https://starship.rs/guide/#%F0%9F%9A%80-installation
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes


### GHCup
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=1

RUN apt-get update && \
    apt-get -y install build-essential \
    libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev zlib1g-dev \
    pkg-config

# https://www.haskell.org/ghcup/install/
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

RUN /root/.ghcup/bin/ghcup install stack latest && \
    /root/.ghcup/bin/ghcup set stack latest
ENV PATH="/root/.ghcup/bin:${PATH}"


### Build haskell-mooc
RUN apt-get update && \
    apt-get -y install zlib1g-dev

WORKDIR /haskell-mooc
COPY exercises ./exercises
RUN cd exercises && stack build


WORKDIR /haskell-mooc/exercises
CMD ["fish"]
