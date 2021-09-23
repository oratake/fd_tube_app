class S3file < ApplicationRecord
  has_one :video
  accepts_nested_attributes_for :video
  
  validates :key, presence: true
end
