FactoryGirl.define do
  factory :election do
    name Faker::Job.title
    start_time "2018-11-21 18:09:01"
    end_time "2018-11-25 18:09:01"
    duration 1
  end
end
