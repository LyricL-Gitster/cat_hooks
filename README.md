# Cat-Hooks Setup

1. Install the correct version of Ruby in whatever way you see fit
1. Install bundler: `gem install bundler`
1. Install server dependencies: `bundle install`
1. Delete `config/credentials.yml.enc`
1. Generated master.key by running `rails secret` and editing the `secret_key_base` property by running `rails credentials:edit`
1. Start Docker dependencies: `docker compose up`
1. Setup database and seed data: `rails db:setup`
