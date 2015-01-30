# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
  	association :user
  	provider 		"facebook"
  	uid					{Faker::Lorem.characters([8,14])}
  end
end
