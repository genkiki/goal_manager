FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client phantomjs
RUN mkdir /goal_manager
WORKDIR /goal_manager
COPY Gemfile /goal_manager/Gemfile
COPY Gemfile.lock /goal_manager/Gemfile.lock
RUN bundle install
COPY . /goal_manager

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
