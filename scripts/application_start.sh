#!/bin/bash -xe

echo 'STOPPING PASSENGER'
passenger stop -p 3000

echo 'STARTING PASSENGER'
/usr/share/rvm/bin/rvm default do bundle exec passenger start -d