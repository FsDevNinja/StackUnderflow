source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'devise'
gem 'bootstrap', '~> 4.0.0'
gem 'sprockets-rails', '~> 3.2'
gem 'simple_form'
gem 'devise-bootstrapped', github: 'king601/devise-bootstrapped'
gem "font-awesome-rails"
gem 'simplemde-rails'
gem 'friendly_id', '~> 5.2'
gem 'searchkick', '~> 1.1', '>= 1.1.2'
gem 'ffaker'
gem 'redcarpet', '~> 3.4'
gem 'rails', '~> 5.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

