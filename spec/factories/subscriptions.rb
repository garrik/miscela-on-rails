# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    event "MyString"
    userid "MyString"
    email "MyString"
    name "MyString"
    band_name "MyString"
    band_members_number 1
    genre "MyString"
    city "MyString"
    notes "MyString"
    website "MyString"
    website2 "MyString"
    video_link "MyString"
    photo { fixture_file_upload(Rails.root.join('spec', 'files', 'roma.jpg'), 'image/png') }
    song1 { fixture_file_upload(Rails.root.join('spec', 'files', 'roma.jpg'), 'image/png') }
    song2 { fixture_file_upload(Rails.root.join('spec', 'files', 'roma.jpg'), 'image/png') }
    attachment { fixture_file_upload(Rails.root.join('spec', 'files', 'roma.jpg'), 'image/png') }
  end
end
