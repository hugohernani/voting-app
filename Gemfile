source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'faker', '~> 1.9.1'
gem 'factory_girl_rails', '~> 4.7.0'
gem "paranoia", "~> 2.2"


gem 'sinatra', github: 'sinatra/sinatra', ref: "88a1ba7bfb2262b68391d2490dbb440184b9f838"
gem 'sidekiq', '~> 4.2', '>= 4.2.2'
gem 'will_paginate', '~> 3.0.4', github: 'jonatack/will_paginate'
gem 'friendly_id', '~> 5.1.0'


gem 'devise', '~> 4.5.0'
gem 'pundit', '~> 2.0.0'
gem "rolify", '~> 5.2.0'
gem "attr_encrypted", "~> 3.0.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


group :development, :test do
  gem 'awesome_print', '~> 1.8.0'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'dotenv-rails', '~> 2.5.0'
  gem 'byebug', '~> 10.0.2', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.0'
end

group :development do
  gem 'puma', '~> 3.12.0'
  gem 'foreman', '~> 0.85.0'
  gem 'web-console', '~> 3.7.0'
  gem 'listen', '~> 3.1.5'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'letter_opener', '~> 1.6.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1.2'
  gem 'simplecov', '~> 0.16.1', require: nil
  gem 'capybara', '~> 3.8.2'
  gem 'launchy', '~> 2.4.3'
  gem 'poltergeist', '~> 1.18.1'
  gem 'database_cleaner', '~> 1.7.0'
end

group :production do
  gem 'unicorn', '~> 5.1.0'
end
