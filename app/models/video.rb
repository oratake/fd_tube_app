class Video < ApplicationRecord
  belongs_to :s3file
  has_many :comments

  validates :title, presence: true
  validates :description, presence: true
end
