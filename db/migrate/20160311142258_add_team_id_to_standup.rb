class AddTeamIdToStandup < ActiveRecord::Migration[5.0]
  def change
    add_column :standups, :team_id, :integer
  end
end
