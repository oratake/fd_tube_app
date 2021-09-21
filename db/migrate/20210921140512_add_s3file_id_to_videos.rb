class AddS3fileIdToVideos < ActiveRecord::Migration[6.1]
  def change
    add_reference :videos, :s3file, foreign_key: true
  end
end
