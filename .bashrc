alias coffee="announce '1. PULLING DOWN MASTER' && git checkout master && git pull --rebase && announce '2. RUNNING BUNDLE INSTALL' && bundle install && announce '3. RUNNING MIGRATIONS' && migrate_dev && migrate_test && yarn install --pure-lockfile"
alias migrate_test="bundle exec rails db:migrate RAILS_ENV=test"
alias migrate_dev="bundle exec rails db:migrate RAILS_ENV=development"
alias nuke-and-pray="yarn-nuke && script/canvas_update && migrate_test && rm -rf public/dist && assets"
alias yarn-nuke="rm -rf node_modules gems/*/node_modules && yarn install && npm rebuild node-sass"
alias assets="bundle exec rake canvas:compile_assets_dev"

function canvas() {
  ttab -d "$HOME/canvas-lms" bundle exec script/delayed_job run
  ttab -d "$HOME/canvas-lms" yarn run build:watch
  ttab -d "$HOME/canvas-lms" redis-server
  ttab -d "$HOME/canvas-lms" bundle exec rails s
  ttab -d "$HOME/canvas-lms" bundle exec rails c
}

announce () {
  printf "\n**** $1 ****\n\n"
}
