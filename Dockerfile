FROM haskell:8

RUN git clone https://github.com/facebookincubator/duckling.git

RUN mkdir /log

WORKDIR /duckling

RUN apt-get update

RUN apt-get install libpcre3 libpcre3-dev

RUN stack build

# Generating locales, add according to your needs
RUN apt-get -y install locales \
    && locale-gen fr_FR.UTF-8 \
    && locale-gen fr_BE.UTF-8 \
    && locale-gen fr_CA.UTF-8 \
    && export LANG=fr_FR.UTF-8

ENTRYPOINT stack exec duckling-example-exe
