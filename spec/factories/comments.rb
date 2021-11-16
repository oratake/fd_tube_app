FactoryBot.define do
  factory :comment do
    sequence(:context) { |n| "TEST_COMMENT#{n}" }
    association :video
    association :user
  end
end
