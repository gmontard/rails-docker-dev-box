#!/bin/bash
bundle check || bundle install
rm -rf tmp/pids/* && bundle exec rails server --port 3000 --binding 0.0.0.0
