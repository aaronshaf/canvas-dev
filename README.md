## Set up Canvas

`brew install libiconv && xcode-select --install`

`createdb canvas_development`

`createdb canvas_test`

`bundle exec rails db:initial_setup`

`RAILS_ENV=test bundle exec rails db:initial_setup`

`RAILS_ENV=test bundle exec rails db:test:reset`

```
psql -c 'CREATE USER canvas' -d postgres
psql -c 'ALTER USER canvas CREATEDB' -d postgres
createdb -U canvas canvas_test
psql -c 'GRANT ALL PRIVILEGES ON DATABASE canvas_test TO canvas' -d canvas_test
psql -c 'GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO canvas' -d canvas_test
psql -c 'GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO canvas' -d canvas_test
RAILS_ENV=test bundle exec rails db:test:reset
```

## Spin up Canvas

`redis-server /usr/local/etc/redis.conf`

`bundle exec rails server`

`yarn run build:js:watch`

`yarn run build:css:watch`

`bundle exec script/delayed_job run`

## Spin up console

`bundle exec rails console`

## Update GraphQL schema

`bundle exec rails graphql:schema`

## Application error reports

Check `/error_reports` in browser

## Client tests

### Karma

`yarn run jspec-watch path/to/file.js`

`yarn run jspec ./spec/javascripts/some-path-or-file.js`

### Jest

`yarn run test:jest`

### JSH

`JSPEC_GROUP="jsh" yarn test:karma:headless`

## Functional tests

### Prep

`bundle exec rake db:migrate RAILS_ENV=test`

Set `config/selenium.yml` to:

```yaml
test:
  host: "localhost"
  browser: "chrome"
```

### Run spec

`bundle exec rspec spec/selenium/the-rest-of-thetestpath`

### Run tests with specific string

`bundle exec rspec spec/selenium/the-rest-of-thetestpath -e "correct grades"`

### Focus on single spec

change

`it "will run this" do`

to:

`it "will run this", :focus => true do`

### Debug with byebug

#### Install

Create `Gemfile.d/username_gemfile.rb` with the following:

```ruby
group :development do
	gem 'faker', '1.8.7'
	gem 'ruby-prof'
	gem 'guard-rspec', require: false
  gem 'rb-readline'
end
```

Then `bundle install`

#### Debug

```
it "will run this" do
  byebug
  1.should == 1
end
```

## Push to Gerrit

`git push origin HEAD:refs/for/master`

`git push origin HEAD:refs/for/dev/yourbranchname`

## Set up RCE/RCS

In `config/dynamic_settings.yml` make sure the rich_content_service section looks like this:
 
```
rich-content-service:
  app-host: 'localhost:3001'
```

Clone the RCS repo, run `yarn` and then `yarn start`.
