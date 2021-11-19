class ChangeColumnsAddNotnullOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_name, :string, default: "", null: false
  end
end
