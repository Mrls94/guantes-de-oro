#!/bin/bash -xe

echo 'STOPPING PASSENGER'
sudo /usr/share/rvm/bin/rvm default do bundle exec passenger stop -p 3000

echo 'STARTING PASSENGER'
/usr/share/rvm/bin/rvm default do bundle exec passenger start -d