class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
    	t.string :year
    	t.integer :wins, :losses, :composite
    	t.decimal :avg_offense, :avg_defense, :win_pct
    	t.belongs_to :team

    	t.timestamps
    end
  end
end
