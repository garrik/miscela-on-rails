source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

#gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.1'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem "haml"
# simpler file upload
gem "paperclip", "~> 3.5.1"
# call 3rd party api
gem "httparty"
gem 'will_paginate', '~> 3.0'

# Include to fix /usr/local/rvm/gems/ruby-1.8.7-p371/gems/execjs-1.4.0/lib/execjs/runtimes.rb:51:in `autodetect': Could not find a JavaScript runtime. See https://github.com/sstephenson/execjs for a list of available runtimes. (ExecJS::RuntimeUnavailable)
# gem 'execjs'
# gem 'therubyracer'

group :production do
  gem 'pg'
end

group :test, :development do
  gem 'sqlite3'
  #gem 'turn'
  gem 'rspec-rails' 
  gem 'capybara'
  gem "factory_girl_rails", "~> 4.0"

  gem 'rb-inotify'
  gem 'guard-rspec'
  gem 'libnotify'
  
  #enable ability to open test page in browser
  gem 'launchy'

  # fix error running 'bundle exec rake assets:precompile' on fedora 17
  # gem 'minitest'
end

#group :development do
#  gem 'win32console'
#end