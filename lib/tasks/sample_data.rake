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

=begin
    20.times do
      name = Faker::Japanese::Name.name
      puts "#{name} (#{name.yomi})"
    end
=end
    1.times do
      User.all(:limit => 6).each do |user|
        name = Faker::Japanese::Name.name
        user.phrases.create!(
          :japanese => "#{name.yomi}",
          :english => Faker::Lorem.sentence(1),
          :source => "ココは引用文",
          :story => "#{name}が語るストーリー。",
          :launch_flg => true)
      end
    end
  end
end