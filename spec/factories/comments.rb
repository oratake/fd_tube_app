FactoryBot.define do
  factory :comment do
    sequence(:context) { |n| "TEST_COMMENT#{n}"}
  end
end
