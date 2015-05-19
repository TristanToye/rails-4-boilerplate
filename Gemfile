source 'https://rubygems.org'

# =======================
# CONFIG 
# =======================

# Local ENV variables for testing & development
gem 'dotenv-rails', :groups => [:development, :test]

# =======================
# RAILS CORE
# =======================

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '>= 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '>= 0.4.0',          group: :doc
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development
# Makes running Rails easier - based on 12factor.net
gem 'rails_12factor', group: :production

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
gem 'rails_admin'
# Slack Support For Notifications
gem 'slack-poster'

# =======================
# UI GEMS
# =======================

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Use Bootstrap Offical Sass Port
gem 'bootstrap-sass', '>= 3.3.3'
# Use FontAwesome Offical Sass Port
gem 'font-awesome-sass', '>= 4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '>= 4.0.0'
# Compress css to inline styles for HTML emails
gem 'roadie-rails'

# =======================
# TESTING
# =======================

group :development, :test do
	# Test Framework we are using
  gem "rspec-rails", ">= 3.1.0"
  # Fixtures replacement
  gem "factory_girl_rails", ">= 4.4.1"
end

group :test do
  gem "rspec-collection_matchers"
	# Fake data generator
  gem "faker", ">= 1.4.3"
  # Simulate User Interactions
  gem "capybara", ">= 2.4.3"
  # Easily reset db between tests
  gem "database_cleaner", ">= 1.3.0"
  # Open web browser from test suite
  gem "launchy", ">= 2.4.2"
  # Test JS browser interactions
  gem "selenium-webdriver", ">= 2.43.0"
end

# =======================
# DEPLOYMENT
# =======================

gem 'capistrano', '>= 3.3.0'

# =======================
# INACTIVE DEFAULTS
# =======================

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]