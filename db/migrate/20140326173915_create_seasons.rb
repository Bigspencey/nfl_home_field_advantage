class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
    	t.integer :wins, :losses, :composite, :off_rank, :def_rank
    	t.decimal :avg_offense, :avg_defense, :win_pct
    	t.integer :year
    	t.belongs_to :team

      t.timestamps
    end
  end
end
