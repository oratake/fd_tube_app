class Video < ApplicationRecord
  has_one :s3file
  accepts_nested_attributes_for :s3file

  validates :title, presence: true
  validates :description, presence: true
end
