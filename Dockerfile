FROM ruby:3.2.2
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["bundle", "exec", "ruby", "./app/main.rb"]
