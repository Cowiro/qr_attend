FROM ruby:3.1.2

RUN apt-get update -qq\
    && apt-get install -y build-essential libpq-dev nodejs\
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler && bundle install
ADD . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000