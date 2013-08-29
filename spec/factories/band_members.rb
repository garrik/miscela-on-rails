# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :band_member do
    subscription_id ""
    name "Vasco"
    surname "Rossi"
    email "vasco.rossi@vrossi.it"
    phone "+39610106"
    rank 1
  end
end
