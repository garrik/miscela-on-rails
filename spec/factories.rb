FactoryGirl.define do
  factory :user do
  	name "John"
  	surname "Doe"
  	email "johndoe@example.com"
  	userid "johndoe"
  	password "password"
  	password_confirmation "password"
  end

  factory :article do
  	title "Lorem Ipsum"
  	content "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget neque vitae nulla lobortis mollis. Mauris pretium commodo placerat."
  	author "Cicero"
  end
end