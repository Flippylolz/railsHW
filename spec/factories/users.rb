FactoryGirl.define do
  factory :user do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.username { Faker::Name.unique.last_name }
    f.birthday { Faker::Date.between(100.year.ago, 18.year.ago) }
    f.email { Faker::Internet.unique.email }
    f.password { Faker::Internet.password(8, 16) }
  end
end
