source :rubygems

gem 'foreman'
gem 'haml'
gem 'json'
gem 'rake'
gem 'rerun'
gem 'sass'
gem 'sinatra', '1.2.6'
gem 'thin'

group :development do
  gem 'annotate'
  gem 'ruby-debug', :require => 'ruby-debug', :platform => :mri_18
  gem 'ruby-debug19', :require => 'ruby-debug19', :platform => :mri_19
end

group :test, :development do
  gem 'awesome_print'
  gem 'turn'
  gem 'watchr'
end

group :test do
  gem 'capybara'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'rack-test'          , '0.5.6'  ,  :require => 'rack/test'
end
