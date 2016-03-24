class AddUserIDtoStandups < ActiveRecord::Migration[5.0]
  def change
    add_column :standups, :user_id, :integer
  end
end
