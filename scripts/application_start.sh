#!/bin/bash -xe

echo 'STOP SPRING'
/usr/share/rvm/bin/rvm default do bundle exec spring stop

echo 'STOPPING PASSENGER'
passenger stop -p 3000

echo 'STARTING PASSENGER'
/usr/share/rvm/bin/rvm default do bundle exec passenger start -a 0.0.0.0 -d -p 80