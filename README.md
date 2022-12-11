# Zero to Production

This is an exploration into Rust based on the series [Zero To Production](https://www.lpalmieri.com/posts/2020-05-24-zero-to-production-0-foreword/) by [Luca Palmieri](https://github.com/LukeMathWalker).

## Introduction

This is a simple email newsletter delivery platform, using Postgres as its general DB, and Redis for auth tokens.
Actual email sending is done by [Postmark](https://postmarkapp.com/), but signing up for the newsletter and publishing a new newsletter issue is handled by this app.

This has authentication in place for all admin related tasks, e.g. sending a new newsletter issue.
This also only sends emails to verified subscribers using confirmation links in the initial sign up email.

## Usage

### DigitalOcean

This is intended to be deployed on DigitalOcean using their [app platform](https://www.digitalocean.com/products/app-platform) and the specification for this application is contained within [spec.yaml](spec.yaml). However, due to the limitations of this platform the Redis instance needs to be provisioned manually.

### Local

It is possible to run this locally as long as you have Docker installed. The following two commands should get you fully functioning Redis and Postgres instances your app instance can connect to.

```sh
./scripts/init_redis.sh
./scripts/init_db.sh
```

You can then run an app instance using `cargo run`.

You may want to pipe the output to [bunyan](https://github.com/trentm/node-bunyan) (or even [bunyan-rs](https://github.com/LukeMathWalker/bunyan)) to format the log output.

## Development

This app uses [sqlx](https://github.com/launchbadge/sqlx) for its DB interactions, this means that to run tests you need access to a development db instance. However you can easily create one using `./scripts/init_db.sh`. You can now run tests using `cargo test`.

I've also included a [justfile](https://github.com/casey/just) with many [commands](justfile) I find useful during development, however this is mainly geared for use inside the included [devcontainer](https://containers.dev/). If you open this repo inside VSCode this devcontainer config should automatically be detected and VSCode will offer to reopen this repository inside the container.

## Disclaimer

I am not going to be maintaining this in a meaningful manner, and will purely use this as an experimentation platform for myself in the future.
