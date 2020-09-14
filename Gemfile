source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma'

gem 'sassc'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'will_paginate', '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'rack-rewrite', '~> 1.5', '>= 1.5.1'

gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'uikit-rails'
gem "breadcrumbs_on_rails"

gem 'devise'
gem "roo", "~> 2.7.0"
gem 'friendly_id', '~> 5.1.0'
gem 'stripe', '~> 3.8'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'geocoder'
gem 'searchkick'
gem 'redis', '~>3.2'
