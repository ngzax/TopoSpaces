source :rubygems

gem "haml"
gem "json"
gem "rake"
gem "sass"
gem "sinatra", '1.2.6'
gem "thin"

# gem "RubyInline"
# gem "rest-client"

group :development do
  gem "annotate"
  gem 'ruby-debug', :require => 'ruby-debug', :platform => :mri_18
  gem 'ruby-debug19', :require => 'ruby-debug19', :platform => :mri_19
end

group :test, :development do
  gem "awesome_print"
  gem "term-ansicolor"
  gem "turn"
end

group :test do
  gem 'capybara'
  gem "minitest"
  gem 'rack-test'          , '0.5.6'  ,  :require => 'rack/test'
end