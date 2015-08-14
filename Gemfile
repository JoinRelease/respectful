source 'https://rubygems.org'
ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bundler', '>= 1.8.4'
gem 'devise'
gem 'sidekiq'
gem 'high_voltage'

# Assets
gem 'non-stupid-digest-assets'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-bootstrap-sass-official'
  gem 'rails-assets-moment'
  gem 'rails-assets-eonasdan-bootstrap-datetimepicker'
  gem 'rails-assets-summernote'
  gem 'rails-assets-select2'
  gem 'rails-assets-select2-bootstrap3-css'
  gem 'rails-assets-jquery-ui'
  gem 'rails-assets-jquery-ui-bootstrap'
  gem 'rails-assets-jquery-cookie'
  gem 'rails-assets-jquery-validate'
  gem "rails-assets-fontawesome", '4.3.0'
  gem 'rails-assets-jquery-pjax'
end

group :development do
  gem 'awesome_print'
  gem 'quiet_assets'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.3.4'
  gem 'factory_girl_rails'
  gem 'faker'

end

group :test do
  gem 'rspec-rails'
  gem "shoulda-matchers"
end

group :production do
  gem 'rails_12factor'
end

