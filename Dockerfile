FROM ruby:3.2

# Node
RUN curl -sL https://deb.nodesource.com/setup_19.x | bash -

# Postgres
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list
RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Install above deps
RUN apt-get update -qq \
    && apt-get install -y build-essential libvips nodejs postgresql-client \
    && apt-get clean \
    && npm install -g yarn npm@latest \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

RUN gem install bundler --no-document
RUN gem update --system && gem install foreman

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* ./
RUN bundle check || bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files
RUN mkdir -p tmp/pids

COPY . ./
