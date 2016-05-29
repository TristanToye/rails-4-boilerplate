source 'https://rubygems.org'
ruby '2.3.1'

# =======================
# CONFIG
# =======================

# Load ENV variables
gem 'dotenv-rails', '>= 2.0.0', require: 'dotenv/rails-now'

# =======================
# RAILS CORE
# =======================

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.2'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.1',          group: :doc
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', '>= 1.3.6', group: :development
# Makes running Rails easier - based on 12factor.net
gem 'rails_12factor', '>= 0.0.3', group: :production
# webserver
gem 'puma'

# =======================
# API
# =======================

# CORS managment for api access via js
gem 'rack-cors', require: 'rack/cors'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 2.3.0'
# API for Ember apps
gem 'active_model_serializers', '>=0.9.3'
# Pagination
gem 'kaminari', '0.16.3'
# Search Queries
# gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'ransack', '1.7.0'
# http request library
gem 'httparty', '>= 0.13.7'

# =======================
# AUTH & SOCIAL LOGINS
# =======================

# The Core Rails Authentication system
gem 'devise'
# Standardized auth system
gem 'omniauth'
# Twitter for omniauth
gem 'omniauth-twitter'
# Facebook for omniauth
gem 'omniauth-facebook'
# Linkedin for omniauth
gem 'omniauth-linkedin'

# =======================
# ADMIN
# =======================

# Core Admin Panel
gem 'rails_admin', '~> 0.8.0'
# Slack Support For Notifications
gem 'slack-poster'

# =======================
# UI GEMS
# =======================

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.0.3'
# Jquery UI
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '>= 2.5.3'
# Make jquery on DOM ready work with turbolinks
gem 'jquery-turbolinks', '>= 2.1.0'
# Use Bootstrap Offical Sass Port
gem 'bootstrap-sass', '~> 3.3.0'
# Use FontAwesome Offical Sass Port
gem 'font-awesome-sass', '~> 4.5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.7.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Compress css to inline styles for HTML emails
gem 'roadie-rails'

# =======================
# TESTING
# =======================

group :development, :test do
  # Test Framework we are using
  gem 'rspec-rails', '>= 3.2.1'
  # Spring for faster gaurd test loading
  gem 'spring-commands-rspec', '>= 1.0.4'
  # Fixtures replacement
  gem 'factory_girl_rails', '>= 4.5.0'

  gem 'rspec-collection_matchers', '>= 1.1.2'
  # Fake data generator
  gem 'faker', '>= 1.6.1'
  # Simulate User Interactions
  gem 'capybara', '>= 2.4.4'
  # Easily reset db between tests
  gem 'database_cleaner', '>= 1.4.1'
  # Open web browser from test suite
  gem 'launchy', '>= 2.4.3'
  # Test JS browser interactions
  gem 'selenium-webdriver', '>= 2.45.0'
  #  Ruby cops
  gem 'rubocop', '~> 0.40.0', require: false
  # Ruboco for Rspec
  gem 'rubocop-rspec'
  # Rubocop for guard
  gem 'guard-rubocop'
end

group :test do
  # Better matchers for Rspec
  gem 'shoulda-matchers', '~> 3.0'
  # Code Coverage
  gem 'simplecov'
  gem 'simplecov-rcov'
  # Reporting for Jenkins
  gem 'ci_reporter'
  # Rspec Reporting for Jenkins
  gem 'ci_reporter_rspec'
end

# =======================
# DEPLOYMENT
# =======================

group :development do
  gem 'capistrano-harrow', git: 'https://github.com/harrowio/capistrano-harrow', tag: '0.3.1'
  gem 'capistrano', '>= 3.4.0'
  gem 'capistrano-rails', '>= 1.1.2'
  gem 'capistrano-bundler', '>= 1.1'
  gem 'capistrano-rvm', '>= 0.1.2'
  gem 'capistrano-touch-linked-files', '>= 0.2.1'
  gem 'capistrano3-puma', github: 'seuros/capistrano-puma'
  gem 'slackistrano', '>= 3.0.1', require: false
end

# =======================
# LIVE RELOAD FOR DEVELOPMENT
# =======================

group :development do
  gem 'guard', '>= 2.12.5', require: false
  gem 'guard-livereload', '>= 2.5.2', require: false
  # Watch test files and run on save, start it with: guard init rspec
  gem 'guard-rspec', '>= 4.6.5', require: false
  gem 'rack-livereload', '>= 0.3.15'
  gem 'rb-fsevent', '>= 0.9.4', require: false
end

# =======================
# INACTIVE DEFAULTS
# =======================

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]
