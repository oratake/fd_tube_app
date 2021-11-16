FactoryBot.define do
  factory :s3file do
    sequence(:key) { |n| "TEST#{n}.mp4" }
    sequence(:file_name) { |n| "TEST#{n}" }
  end
end
