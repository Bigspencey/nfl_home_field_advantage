class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, id: false, primary_key: 'mascot' do |t|
    	t.string :name, :mascot, :stadium_name

      t.timestamps
    end
  end
end
