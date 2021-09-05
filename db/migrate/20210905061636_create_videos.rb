class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.integer :user_id
      t.text :path
      t.string :title
      t.text :description
      t.text :text

      t.timestamps
    end
  end
end
