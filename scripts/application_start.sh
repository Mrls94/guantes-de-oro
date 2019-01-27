#!/bin/bash -xe

echo 'STOPPING PASSENGER'
sudo /home/ubuntu/.rvm/bin/rvm default do bundle exec passenger stop

echo 'STARTING PASSENGER'
/home/ubuntu/.rvm/bin/rvm default do bundle exec passenger start -d