# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite, :class => 'Favorites' do
    user_id 1
    phrase_id 1
    delete_flg false
  end
end
