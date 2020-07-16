FROM ruby:2.6-alpine
RUN mkdir /usr/src/app
WORKDIR /usr/src/app/
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
RUN gem install bundler -v 2.0.2
RUN bundle install
COPY . /usr/src/app
ENTRYPOINT ruby start_game.rb

# docker run -a stdin -a stdout -it canary-hangman:latest