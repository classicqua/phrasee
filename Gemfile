source 'https://rubygems.org'
gem 'rails', '3.2.11'

group :development do
  gem 'annotate', '2.5.0'
end

# 定数管理
gem 'settingslogic'

# ダミーデータ
gem 'faker', '>= 1.0.1'
gem 'faker-japanese'
  
group :development, :test do
  gem 'sqlite3', '1.3.7'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0' 
  gem 'spork', '0.9.2'
  gem 'pry-rails'
  gem 'pry-doc'

end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "thin", ">= 1.5.0"
gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "capybara", ">= 2.0.2", :group => :test
gem "database_cleaner", ">= 0.9.1", :group => :test
gem "email_spec", ">= 1.4.0", :group => :test
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "bootstrap-sass", ">= 2.2.2.0"
gem "hominid", ">= 3.0.5"
gem "devise", ">= 2.2.3"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.0.4"
gem 'country_select' # 2/13追加
gem "quiet_assets", ">= 1.0.1", :group => :development
gem "figaro", ">= 0.5.3"
gem "better_errors", ">= 0.3.2", :group => :development
gem "binding_of_caller", ">= 0.6.8", :group => :development
gem "hub", ">= 1.10.2", :require => nil, :group => [:development]

gem 'bcrypt-ruby', '>= 3.0.1'
gem 'will_paginate', '>= 3.0.3'
gem 'bootstrap-will_paginate', '>= 0.0.6'

  
gem 'carrierwave'
#gem 'rmagick', '2.13.2'

group :production do
  gem 'pg'
end
