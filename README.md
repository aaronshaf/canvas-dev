## Spin up Canvas

`redis-server /usr/local/etc/redis.conf`

`bundle exec rails server`

`yarn run build:js:watch`

`yarn run build:css:watch`

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

```
it "will run this" do
  byebug
  1.should == 1
end
```

## Push to Gerrit

`git push origin HEAD:refs/for/master`

`git push origin HEAD:refs/for/dev/yourbranchname`
