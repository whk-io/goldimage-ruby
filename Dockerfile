FROM ubuntu:20.04 AS base
RUN apt-get update -y && \
apt-get install -y git \
wget \
autoconf \
bison \
build-essential \
libssl-dev \
libyaml-dev \
libreadline6-dev \
zlib1g-dev \
libncurses5-dev \
libffi-dev \
libgdbm6 \
libgdbm-dev
RUN useradd --uid 1993 --user-group -m -d /ruby ruby \
 && chown ruby:ruby /ruby/
USER ruby
WORKDIR /ruby/
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN cat ~/.bashrc
RUN ["bash", "-i", "-c", "rbenv install 2.7.1"]
RUN ["bash", "-i", "-c", "rbenv rehash"]
RUN ["bash", "-i", "-c", "rbenv global 2.7.1"]
RUN echo "gem: --no-document" > ~/.gemrc
