FROM ruby:2.6.1
LABEL maintainer="Mohammad Mahmoodi <mm580486@gmail.com>"
# Install packages for building ruby
RUN apt-get update -y && apt upgrade -y
CMD curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
CMD echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y cron apt-transport-https build-essential libpq-dev nodejs ruby-dev
RUN apt-get install -y postgresql postgresql-contrib nano
RUN apt install -y --no-install-recommends yarn

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs
RUN apt-get update -y 

ENV RAILS_ROOT /app/back/abrcms/BE
ENV RAILS_ENV production
ENV ENABLE_COMPRESSION 1
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
ADD Gemfile ./Gemfile


COPY . .

RUN bundle install --binstubs --deployment

RUN if [[ "$RAILS_ENV" == "production" ]]; then \
      mv config/credentials.yml.enc config/credentials.yml.enc.backup; \
      mv config/credentials.yml.enc.sample config/credentials.yml.enc; \
      mv config/master.key.sample config/master.key; \
      bundle exec rails assets:precompile; \
      mv config/credentials.yml.enc.backup config/credentials.yml.enc; \
      rm config/master.key; \
    fi


CMD ["bin/secret"]
CMD npm i
CMD rails db:migrate RAILS_ENV=production

CMD ["bundle", "exec", "rails", "db:migrate", "RAILS_ENV=production"]
CMD bundle exec whenever

ENV PORT 1515



