class RenameDateColumnToVideos < ActiveRecord::Migration[6.1]
  def change
    rename_column :videos, :date, :data
  end
end
