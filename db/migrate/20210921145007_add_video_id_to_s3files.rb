class AddVideoIdToS3files < ActiveRecord::Migration[6.1]
  def change
    add_reference :s3files, :video, foreign_key: true
  end
end
