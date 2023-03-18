# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'cells-erb'
gem 'cells-rails'
gem 'cssbundling-rails'
gem 'dry-validation'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'simple_form'
gem 'sprockets-rails'
gem 'trailblazer-cells'
gem 'trailblazer-rails'
gem 'dry-validation'
gem 'reform'
gem 'reform-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
