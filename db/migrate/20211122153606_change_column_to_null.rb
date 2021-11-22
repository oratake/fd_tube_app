class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :users, :user_name, true
  end
  
  def down
    change_column_null :users, :user_name, false
  end
end
