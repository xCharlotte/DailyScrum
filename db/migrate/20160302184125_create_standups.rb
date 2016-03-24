class CreateStandups < ActiveRecord::Migration[5.0]
  def change
    create_table :standups do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
