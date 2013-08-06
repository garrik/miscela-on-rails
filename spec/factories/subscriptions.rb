# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    event "MyString"
    userid "MyString"
    email "MyString"
    name "MyString"
    band_name "MyString"
    band_members 1
    genre "MyString"
    city "MyString"
    notes "MyString"
    website "MyString"
    website2 "MyString"
    video_link "MyString"
  end
end
