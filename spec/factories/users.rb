# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name 			{Faker::Name.name}
  	email 		{Faker::Internet.email}
  	admin			false
		password 	{Faker::Internet.password(min_length = 8)}

    factory :invalid_user do
    	email 		nil
    end

    factory :admin_user do
    	admin 		true
    end
  end
end
