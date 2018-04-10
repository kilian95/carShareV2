source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'redis', '~> 4.0', '>= 4.0.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'simple_form', '~> 3.5'
gem 'devise', '~> 4.3'  #user authentication
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17', '>= 4.17.47'
gem 'momentjs-rails', '~> 2.17', '>= 2.17.1'
gem 'carrierwave', '~> 1.2', '>= 1.2.1'  #imageupload
gem 'mini_magick', '~> 4.8' #imageupload
gem 'ransack', '~> 1.7' #search
gem "fog-aws" #image upload to aws s3
gem 'kaminari', '~> 1.1', '>= 1.1.1' #paginator
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.3'
gem 'jquery-easing-rails', '~> 0.0.2'
gem 'tether-rails', '~> 1.4'
gem 'figaro', '~> 1.1', '>= 1.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
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
