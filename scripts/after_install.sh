#!/bin/bash -xe

echo 'Installing gems'
/home/ubuntu/.rvm/bin/rvm default do bundle install --deployment

echo 'Compiling assets'
/home/ubuntu/.rvm/bin/rvm default do bundle exec rake assets:precompile

echo 'Run migrations'
/home/ubuntu/.rvm/bin/rvm default do bundle exec rake db:migrate RAILS_ENV=$RAILS_ENV

