class Season < ActiveRecord::Base
	belongs_to :team
	belongs_to :year
end
