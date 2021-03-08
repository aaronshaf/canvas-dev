## Pointer Docker service to local Canvas

1. Point canvas to 0.0.0.0 in /etc/hosts

2. Change domain.yml (is there an "override" way to do this?):
development:
```
  domain: "canvas:3000"
```

3. Add the following to web: in my docker-compose.override.yml file:
```
    extra_hosts:
      canvas: [my machine IP]
```

4. Launch rails server with binding:
```
bundle exec rails server -b 0.0.0.0
```
