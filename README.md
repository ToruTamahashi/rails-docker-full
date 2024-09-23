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

初期設定時のみ実行
docker compose run web rails webpacker:install
docker compose run web rake db:create


新しいapiを作る
docker compose run web bin/rails g scaffold User name:string
docker compose run web bin/rake db:migrate

