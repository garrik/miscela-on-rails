FactoryGirl.define do
  factory :user do
  	name "John"
  	surname "Doe"
  	email "johndoe@example.com"
  	userid "johndoe"
  	password "password"
  	password_confirmation "password"
  end
end