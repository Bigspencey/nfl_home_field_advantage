class Season < ActiveRecord::Base
	belongs_to :team, foreign_key: 'mascot'
	belongs_to :year, foreign_key: 'year'
end
