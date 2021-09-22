class Video < ApplicationRecord
  has_one :s3file
  accepts_nested_attributes_for :s3file
end
