FactoryGirl.define do
  factory :voter do
    email Faker::Internet.email
    election
  end
end
