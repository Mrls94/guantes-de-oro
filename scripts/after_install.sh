#!/bin/bash -xe

echo 'Installing gems'
/usr/share/rvm/bin/rvm default do bundle install --deployment

echo 'Compiling assets'
/usr/share/rvm/bin/rvm default do bundle exec rake assets:precompile

echo 'Run migrations'
/usr/share/rvm/bin/rvm default do bundle exec rake db:migrate RAILS_ENV=$RAILS_ENV

