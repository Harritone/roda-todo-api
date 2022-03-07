# todo-api

JSON API for todo project build with Roda + sequel

### Clone the Repo

```shell
git clone git@github.com:Harritone/roda-todo-api.git
cd todo-api
```

### Check your Ruby version

```shell
ruby -v
```

The output shouldt start with something like `ruby 3.0.0`
If not, install the right version.

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle install
```

### Setup Database

This project uses PostgreSQL by default, to setup database for development and test environment
use following instructions:

1. Create `.env.development` for development environment.
2. Add `DATABASE_URL=postgres:///todo-api-development` and `createdb todo-api-development` locally
3. Create `.enve.test` for test environment.
4. Add `DATABASE_URL=postgres:///todo-api-test` and `createdb todo-api-test` locally

### Migrate database

1. To migrate database in development environment use: `rake db:migrate`
2. To migrate database in test environment use: `RACK_ENV=test rake db:migrate`
3. To migrate database in production environment use: `RACK_ENV=production rake db:migrate`.

### Running the app

You can start your application using `rackup` command.

### Generating documentation

You can generate documentation using `rake docs` command.

### Launching tests

You can launch tests using `rspec` command.

### Seed database

To populate data with seeds use `rake db:seed` command.

### Check code style

To check code style use `rubocop` command.
