class AddFileNameToS3files < ActiveRecord::Migration[6.1]
  def change
    add_column :s3files, :file_name, :string
  end
end
