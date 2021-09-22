class S3file < ApplicationRecord
  belongs_to :video
  
  validates :key, presence: true
end
