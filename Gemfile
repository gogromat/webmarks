source 'https://rubygems.org'

gem 'rails', '3.2.8'
# Password encryption
gem 'bcrypt-ruby', '3.0.1'
# Fake data
gem 'faker', '1.0.1'
# Pagination
gem 'will_paginate', '3.0.3'
# Sass & Bootstrap
gem 'bootstrap-sass', '2.0.4'
gem 'bootstrap-will_paginate', '0.0.6'

# ImageMagick support

gem 'launchy'

# File
gem 'paperclip'

# PostGreSQL
gem 'pg', '0.12.2'

# Annotation to ActiveRecord's
gem 'annotate', '2.5.0', group: :development

group :test, :development do
  gem 'rspec-rails', '2.10.0'
  gem 'guard-rspec', '0.5.5'
  gem 'guard-spork', '0.3.2'
  gem 'spork',       '0.9.0'
end

group :test do
  gem 'guard-spork', '0.3.2'
  gem 'spork', 		   '0.9.0'
  # BDD
  gem 'capybara',    '1.1.2' # git: 'git://github.com/jnicklas/capybara.git'
  # Factory - ActiveRecord
  gem 'factory_girl_rails', '4.1.0'
  # BDD
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'rb-fchange',   '0.0.5'
  gem 'rb-notifu',    '0.0.4'
  gem 'win32console', '1.3.0'
  # for Selenium driver
  gem 'database_cleaner'
end

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # JS
  # gem 'therubyracer', :platforms => :ruby
  # Compress JS
  gem 'uglifier', '>= 1.0.3'

  # JQuery
  gem 'jquery-rails'
  # JQuery UI
  gem 'jquery-ui-rails'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'
# Use unicorn as the app server
# gem 'unicorn'
# Deploy with Capistrano
# gem 'capistrano'
# To use debugger
# gem 'debugger'

group :production do #this is used on heroku
  gem "rmagick", "2.13.1"#, require: "RMagick"
end