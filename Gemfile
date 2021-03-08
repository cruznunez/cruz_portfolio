source 'https://rubygems.org'
# gem 'tzinfo-data'#used for Windows timezone bug
# gem 'coffee-script-source', '1.8.0'#used for windows javascript_include_tag bug
ruby '2.3.0'
gem 'rails', '4.2.1'
gem 'jquery-minicolors-rails'
gem 'font-awesome-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'bcrypt', '~> 3.1.9'
gem 'paperclip', '~> 4.2'
gem 'aws-sdk', '< 2.0'
gem 'meta-tags'
gem 'kaminari'
gem 'sdoc', '~> 0.4.0', group: :doc

group :production do
  # gem 'pg'
  gem 'pg', '~> 0.18.0' # v1.0 does not work with heroku lol

  gem 'rails_12factor'
end
group :development, :test do
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'spring'
  gem 'sqlite3'
  # gem 'web-console', '~> 2.0'
end
