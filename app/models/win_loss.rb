class WinLoss < ActiveRecord::Base

	def self.boom!

		doc = Nokogiri.parse(HTTParty.get("http://espn.go.com/nfl/standings/_/year/2013/group/1"))
		parse_each_year(doc)
	end

	def parse_each_year(doc)
		
	end
end
