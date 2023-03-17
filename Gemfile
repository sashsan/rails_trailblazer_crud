# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'cssbundling-rails'
gem 'dry-validation'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'sprockets-rails'
gem 'cells-rails'
gem 'cells-erb'
gem 'trailblazer-cells'
gem 'trailblazer-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
end

group :development do
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
