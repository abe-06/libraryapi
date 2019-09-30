# Use the barebones version of Ruby 2.2.3.
FROM ruby:2.2.3-slim

# Optionally set a maintainer name to let people know who made this image.
MAINTAINER Nick Janetakis <nick.janetakis@gmail.com>

# Install dependencies:
#   - build-essential: To ensure certain gems can be compiled
#   - nodejs: Compile assets
#   - libpq-dev: Communicate with postgres through the postgres gem
#   - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /drkiq
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
FROM ruby:2.5.3

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

COPY Gemfile Gemfile.lock ./

RUN gem install rails bundler
RUN gem install rails
RUN bundle install --jobs 20 --retry 5

RUN apt-get update -qq && apt-get install -y nodejs

ENTRYPOINT [ "/bin/bash" ]