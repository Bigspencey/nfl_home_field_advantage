class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name, :mascot, :stadium_name, :espn_id

      t.timestamps
    end
  end
end
