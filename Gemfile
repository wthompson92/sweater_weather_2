source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.11'
gem 'pg'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'figaro'
gem 'faraday'
gem 'fast_jsonapi'


group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false

end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
