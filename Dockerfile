FROM ruby:2.4.1
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git-core \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    nodejs \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev \
    libpq-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
RUN mkdir -p /root/.ssh/

WORKDIR /app

RUN ssh-keyscan -H github.com >> ~/.ssh/known_hosts

ENV GEM_HOME /bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_PATH /bundle
ENV BUNDLE_BIN /bundle/bin

RUN gem install bundler -v '1.10.6' \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin"
