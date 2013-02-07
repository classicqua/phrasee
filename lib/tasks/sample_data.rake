# encoding: UTF-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar123",
                 password_confirmation: "foobar123")
    1.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

# ダミー
Category.find_or_create_by_category_name([{ category_name: 'あいさつ' }, { category_name: '空港' }, { category_name: 'レストラン' }, { category_name: 'ホテル' }, 
  { category_name: 'お買い物' }, { category_name: '映画' }, { category_name: '本' }, { category_name: '音楽' }, 
  { category_name: 'ビジネス' }, { category_name: 'コンピュータ' }, { category_name: 'その他' } ]) if Category.nil?


=begin
    20.times do
      name = Faker::Japanese::Name.name
      puts "#{name} (#{name.yomi})"
    end
=end
    1.times do
      User.all(:limit => 6).each do |user|
        #cid = rand( Category.count )
        cid = rand(11)

        name = Faker::Japanese::Name.name
        user.phrases.create!(
          :japanese => "#{name.yomi}",
          :english => Faker::Lorem.sentence(1),
          :source => "ココは引用文",
          :story => "#{name}が語るストーリー。",
          :category_id => cid,
          :launch_flg => true)
      end
    end
  end
end