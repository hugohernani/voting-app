FactoryGirl.define do
  factory :candidate do
    name Faker::Name.name
    votes_count 0
    election
  end
end
