## Create your own gemfile

```ruby
group :development do
  gem 'faker', '1.8.7'
  gem 'ruby-prof'
  gem 'guard-rspec', require: false
  gem 'rb-readline'
end
```

## Then

`bundle install`
`rails db:seed`
