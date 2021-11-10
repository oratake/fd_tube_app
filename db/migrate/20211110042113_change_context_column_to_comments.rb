class ChangeContextColumnToComments < ActiveRecord::Migration[6.1]
  def change
    change_column_null :comments, :context, false, 0
  end
end
