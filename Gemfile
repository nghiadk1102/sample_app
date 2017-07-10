source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "3.1.11"
gem "bootstrap-sass", "3.3.7"
gem "bootstrap-will_paginate"
gem "capistrano-rails", group: :development
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "ffaker"
gem "fog"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "mini_magick"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.1"
gem "rails-controller-testing"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "will_paginate"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "sqlite3"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  gem "sqlite3"
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'taps'
  gem 'rvm'
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
