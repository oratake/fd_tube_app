class Video < ApplicationRecord
  belongs_to :s3file

  validates :title, presence: true
  validates :description, presence: true
end
