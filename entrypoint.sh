#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /fd_tube_app/tmp/pids/server.pid

bundle exec rails assets:precompile

# 初回のみdb:createとrails db:seedを実行
# bundle exec rails db:create
bundle exec rails db:migrate
# bundle exec rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
