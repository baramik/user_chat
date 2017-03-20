# README

* Ruby version
Version of ruby is ruby-2.3.1, rvm is used as ruby version control system you can find .ruby-gemset and .ruby-version files in the root of the project

* System dependencies: 
For using system you'll need redis, pg installed on your local machine
if you already have installed bundler
run bundle:install in console in order to install all required system dependencies

* Configuration: 
database configuration should be stored in database.yml
there is a file called database.yml.example. Just rename it and use it as a reference 

* Database creation:
To create database run rails db:create. 

* Database initialization
Also you need to run database migrations run rails db:migrate

* How to run the test suite
To run test suite run rspec in the root of the project
