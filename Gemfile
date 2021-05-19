source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'carrierwave'
gem 'devise'
gem 'devise-i18n'
gem 'figaro'
gem 'jquery-rails'
gem 'puma', '~> 5.3'
gem 'rails', '~> 5.2.1'
gem 'rails-i18n', '~> 5.1'
gem 'rails_admin'
gem 'rmagick'
gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'uglifier', '~> 3.0.4'

group :development, :test do
  gem 'awesome_rails_console'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'fuubar'
  gem 'listen'
  gem 'pry'
  gem 'rb-readline'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'shoulda-matchers'
  gem 'sqlite3', '~> 1.3.6'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'fog-aws'
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]