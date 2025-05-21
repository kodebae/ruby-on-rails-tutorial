FROM ruby:3.1.6

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

# ✅ Patch for Rails bug — preload Logger to avoid error
RUN mkdir -p /usr/local/lib/ruby/site_ruby && \
    echo "require 'logger'" > /usr/local/lib/ruby/site_ruby/logger_patch.rb

# Set working directory
WORKDIR /app

# ENV to autoload the logger patch
ENV RUBYOPT="-rlogger_patch"

# Install specific versions
RUN gem install bundler -v 2.6.2
RUN gem install rails -v 7.0.8

# Copy everything in
COPY . .

# Default CMD (not used by generator)
# Commenting out for now
# CMD ["rails", "server", "-b", "0.0.0.0"]
CMD ["bash", "-c", "bin/rails db:prepare && bundle exec puma -C config/puma.rb"]

