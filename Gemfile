source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.8'
gem 'mongoid', '~> 5.0.0'
gem 'newrelic_rpm'

# API
gem 'rails-api'
gem 'grape'
gem 'grape-entity', '~> 0.4.0'

group :development, :test do
  gem 'pry'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-byebug'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'mongoid-rspec'
  gem "codeclimate-test-reporter", require: nil
  gem 'shoulda-matchers'
  gem 'database_cleaner', git: 'https://github.com/DatabaseCleaner/database_cleaner.git'
end

group :production do
  gem 'rails_12factor'
end

