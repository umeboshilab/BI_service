#!/bin/sh
echo "start entrypoint.sh"
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

echo "removed server.pid"

# 本番では消す
# bundle exec rails db:create
# bundle exec rails db:migrate
# bundle exec rails db:seed

# echo "created db"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"