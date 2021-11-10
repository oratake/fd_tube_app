class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :context
      t.references :user
      t.references :video

      t.timestamps
    end
  end
end
