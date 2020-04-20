# Tweet Stream Actions

## Requirements
Requires Ruby version 2.6 and above

## Setup
All the commands have to be run from project root.

Install the project dependencies
```
bundle
```

Since the setup uses SQLite by default, there is no need to install any database on machine separately.
Just load database schema and you're good to go.
```bash
bin/rails db:schema:load
```

Run tests (requires `rspec`)
```bash
rspec -fd .
```

Now, run the puma server to listen for HTTP requests
```bash
bin/rails s
```

To jump to interactive rails console
```bash
bin/rails c
```

## Usage

It listens for HTTP POST requests on `/listen` endpoint

You can hit the server with tweet data like following.
```
payload='{"tweet": {"username":"lokeshdevnani","content":"useless tweet"}}'
curl -H "Content-Type: application/json" -X POST -d "$payload" http://localhost:3000/listen    
```

Server will then match the incoming tweet data with the configured trigger rules, and correspondingly fires actions/tasks.


## Trigger Configuration
Currently, you can edit the trigger configuration only by Rails Console.
Supported triggers are `Hashtag` and `NthUserTweet`:

### Hashtag Trigger
It is triggered every time a tweet with the configured hashtag enters the system.

```ruby
config = ConfigHashtag.create(hashtag: 'india')
criteria = Criterion.create(name: 'India hashtag', trigger_config: config)
criteria.actions << Action.create(action_type: 'HTTP',  config: { url: 'http://dummy', method: 'post' })
```


### NthUserTweet Trigger
It is triggered for every iNth tweet by the configured user for i belonging to all natural numbers
N <- Configured Interval
```
config2 = ConfigNthUserTweet.create(username: 'tj', interval: 2)
criteria2 = Criterion.create(name: 'every 2nd TJ tweet',
                             trigger_config: config2)
criteria2.actions = [Action.create(action_type: 'HTTP',
                                   config: { url: 'http://dummy2',
                                             method: 'post' })]
```
