FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "family#{n}" }
    creator_id "1"
  end
end
