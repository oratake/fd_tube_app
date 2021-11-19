class Video < ApplicationRecord
  belongs_to :s3file
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
