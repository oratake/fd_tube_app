FactoryBot.define do
  factory :video do
    sequence(:title) { |n| "TEST_TITLE#{n}"}
    sequence(:description) { |n| "TEST_TEXT"}
    sequence(:remarks) { |n| "TEST_TEXT#{n}"}
  end
end
