class RenamePathColumnToVideos < ActiveRecord::Migration[6.1]
  def change
    rename_column :videos, :path, :date
  end
end
