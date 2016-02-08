# Setup

Run `rake db:setup`

Start the server: `bundle exec rails s`

# Usage


You can use curl:

```
curl http://localhost:3000/v1/publi/locations/PL
```

For the private section you have to grab the key first:

```
curl http://localhost:3000/v1/private/locations/PL -H "Authorization: Token token=\"`bundle exec rails runner 'print ApiKey.last.token'`\""
```

For example to evaluate the target:
```
echo '{"country_code":"PL","locations":[{"id":1,"panel_size":200}],"target_group_id":1}' | curl http://localhost:3000/v1/private/evaluate_target -X POST -H "Authorization: Token token=\"`bundle exec rails runner 'print ApiKey.last.token'`\"" -H "Content-Type:application/json" -d @-
```

# Testing

Do: `bundle exec rspec`
