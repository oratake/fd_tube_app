class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.text :remarks
      t.integer :s3file_id

      t.timestamps
    end
  end
end
