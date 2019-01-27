#!/bin/bash -xe

echo 'STOPPING PASSENGER'
sudo /usr/share/rvm/bin/rvm default do bundle exec passenger stop

echo 'STARTING PASSENGER'
/usr/share/rvm/bin/rvm default do bundle exec passenger start -d --port 80