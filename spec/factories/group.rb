FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "family#{n}" }
    sequence(:creator) { 1 }
  end
end
