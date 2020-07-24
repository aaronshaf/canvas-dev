## Run Selenium tests locally

`bundle exec rake db:migrate RAILS_ENV=test`

Set `config/selenium.yml` to:

```yaml
test:
  host: "localhost"
  browser: "chrome"
```

`bundle exec rspec spec/selenium/the-rest-of-thetestpath`
