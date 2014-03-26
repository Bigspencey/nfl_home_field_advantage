class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
    	t.integer :wins, :losses, :composite
    	t.decimal :avg_offense, :avg_defense, :win_pct
    	t.belongs_to :year
    	t.belongs_to :team
    	
      t.timestamps
    end
  end
end
