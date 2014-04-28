class CreateYears < ActiveRecord::Migration
  def change
    create_table :years, id: false, primary_key: 'year' do |t|
    	t.string :year
    	t.string :start_date

      t.timestamps
    end
  end
end