class ChangeMyCompleteTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :standups, :title
    remove_column :standups, :text
    
    add_column :standups, :yesterday, :text
    add_column :standups, :today, :text
    add_column :standups, :problems, :text
  end
end
