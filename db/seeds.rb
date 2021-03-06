#coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

=begin
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.confirm!
=end

puts 'AdminUser'
admin_user = AdminUser.find_or_create_by_email :email => ENV['ADMIN_USER_EMAIL'].dup, :password => ENV['ADMIN_USER_PASSWORD'].dup
puts "How many admin_users exist? : #{AdminUser.count.to_s}"

# フレーズカテゴリー
categories = [
 "あいさつ・日常会話",
 "旅行",
 "ホテル",
 "空港",
 "レストラン",
 "お買い物",
 "映画",
 "本",
 "音楽",
 "ビジネス",
 "コンピュータ",
 "子育て",
 "名言",
 "おもしろネタ",
 "その他"
]
categories.each do |c|
  Category.find_or_create_by_category_name({ :category_name => c }, :without_protection => true)
end

=begin
Category.create ([
 { category_name: 'あいさつ' },
 { category_name: '旅行' },
 { category_name: 'ホテル' },
 { category_name: '空港' },
 { category_name: 'レストラン' },
 { category_name: 'お買い物' },
 { category_name: '映画' },
 { category_name: '本' },
 { category_name: '音楽' },
 { category_name: 'ビジネス' },
 { category_name: 'コンピュータ' },
 { category_name: '子育て' },
 { category_name: '名言' },
 { category_name: 'おもしろネタ' },
 { category_name: 'その他' } ]) unless Category.count > 0
=end
