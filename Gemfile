source 'https://rubygems.org'
ruby "~> 2.6.6"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0', '>= 6.0.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# J Query
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Bootstrap
gem 'bootstrap-sass'
#Contact Forms
gem 'mail_form'
# SEO
gem 'meta-tags'
# Buggyng
gem 'rails_12factor', group: :production
# Owl Carousel 
gem 'owlcarousel-rails'
# Users
gem 'devise'
# Calendar js
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'underscore-rails'
# Charts
gem 'chartkick'
# Grouping by dates
gem 'groupdate'
# Geolocation
gem 'geocoder'
# PDF generator
gem 'prawn_rails'
gem 'prawn-table'
# Click and update
gem 'best_in_place'
# Search and Filter
gem 'ransack'
# Pagination
gem 'will_paginate'
# grab info
gem 'grabbit'
#tags
#gem 'acts-as-taggable-on'
#impressions
gem 'impressionist'
# votes
gem 'acts_as_votable'
# images
gem 'carrierwave'
# Friendly Ids
gem 'friendly_id'
# facebook auth
gem 'omniauth-facebook'
# change nam
gem 'rename'
# Amazon s3
gem "figaro"
gem "fog"
gem "fog-aws"
# crop images
gem "mini_magick"
# nested models
gem "cocoon"
#carousel
gem 'photoswipe-rails'

gem 'bootsnap', require: false

gem 'searchkick'
gem 'cancancan'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
