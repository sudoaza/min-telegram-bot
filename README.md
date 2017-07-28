# Minimal Telegram Bot

Basic implementation of a Telegram bot using [Telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby),
Rack and DataMapper.

## Config

Create .env file with:

    TELEGRAM_TOKEN=00000000:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    DATABASE_URL=postgres://user:pass@host/database

Suports postgres and (maybe) sqlite.

## Create Database

    rake db:create

Check other usefull tasks with `rake -T`

## Start

    rackup


