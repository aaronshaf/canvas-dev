## Spin up Canvas

`redis-server /usr/local/etc/redis.conf`

`bundle exec rails server`

`yarn run build:js:watch`

`yarn run build:css:watch`

## Update GraphQL schema

`bundle exec rails graphql:schema`

## Karma

`yarn run jspec-watch path/to/file.js`

`yarn run test:jest`

## Check application error reports

Check `/error_reports` in browser

## Run Selenium tests

`bundle exec rake db:migrate RAILS_ENV=test`

Set `config/selenium.yml` to:

```yaml
test:
  host: "localhost"
  browser: "chrome"
```

`bundle exec rspec spec/selenium/the-rest-of-thetestpath`
