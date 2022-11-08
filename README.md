
# DiscordBot

A Discord Bot made with ruby and discordrb gem. There are two versions, one with the normal commands and prefix "!" and another with the last aproach of discord with slash commands(branch: `slash-commands`)


## Dependencies

- Ruby 3.1.2
- PostgreSQL

## Run Locally

Clone the project

```bash
  git clone https://github.com/D-Forz/DiscordBot.git
```

Go to the project directory

```bash
  cd DiscordBot
```

Create the database and run migrations.

You need to create a Database with the same
name as in `config/database.yml`

```bash
  rake db:create
  rake db:migrate
```

Install dependencies

```bash
 bundle install
```


Start the bot

```bash
  bundle exec ruby app.rb
```


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`TOKEN`

`APPLICATION_ID`


## Contributing

Contributions are always welcome!

contant with me at discord `@D-Forz#0526` for ways to get started.
