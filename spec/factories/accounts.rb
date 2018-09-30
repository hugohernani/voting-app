FactoryGirl.define do
  factory :account do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Time.current

    after :build do |account|
      account.add_role(:default_user) if account.roles.empty?
    end
  end
end
