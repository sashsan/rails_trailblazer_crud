# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'cells-erb'
gem 'cells-rails'
gem 'cssbundling-rails'
gem 'dry-validation'
gem 'dry-validation'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'reform'
gem 'reform-rails'
gem 'simple_form'
gem 'sprockets-rails'
gem 'trailblazer-cells'
gem 'trailblazer-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot', '~> 6.2'
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'trailblazer-test'
end

group :development do
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
