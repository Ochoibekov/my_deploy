source 'https://rubygems.org'

gem 'puma', '~> 3.12'
gem 'dotenv-rails'
gem 'foreman'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '3.10.1'
  gem 'capistrano-bundler'
  gem 'capistrano-foreman'
  gem 'capistrano-logtail'
  gem 'capistrano-rails'
  gem 'capistrano-rails-collection'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'rubocop', require: false
  gem 'sshkit-sudo'
end

group :development, :test do
  gem 'ffaker'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

