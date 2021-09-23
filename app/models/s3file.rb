class S3file < ApplicationRecord
  has_one :video
  accepts_nested_attributes_for :video
  
  validates_associated :video
  validates :key, presence: true
  validates :video, presence: true
end
