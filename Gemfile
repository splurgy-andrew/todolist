source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'haml'
gem 'sass'

gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml-rails'

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'cucumber-rails'
end

group :development, :test, :cucumber do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
end

gem 'jquery-rails'
gem 'client_side_validations'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
