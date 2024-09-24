# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

initialization
docker compose run web rails webpacker:install
docker compose run web rake db:create

if migration data is exist
docker compose run web bin/rails db:migrate RAILS_ENV=development


scaffold example 
docker compose run web bin/rails g scaffold User name:string
docker compose run web bin/rake db:migrate

