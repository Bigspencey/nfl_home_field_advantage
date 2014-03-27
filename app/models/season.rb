class Season < ActiveRecord::Base
	belongs_to :team
	belongs_to :year

	def self.boom!
		Season.find_urls
	end

	private

	def self.find_urls
		urls = []
		Year.all.each do |year|
			urls << "http://espn.go.com/nfl/standings/_/year/#{year.year}/group/1"
		end
		Season.parse_each_url(urls)
	end

	def self.parse_each_url(urls)
		urls.each do |url|
			doc = Nokogiri.parse(HTTParty.get(url))
			Season.find_home_win_loss(doc)
		end
	end

	def self.find_home_win_loss(doc)
		Team.all.each do |team|
			if doc.search(".#{team.espn_id} a").inner_text == team.name
				total_record = doc.search(".#{team.espn_id} td:nth-child(6)").inner_text
				Season.save_home_record(total_record, team)
			end
		end
	end

	def self.save_home_record(total_record, team)
		wins = total_record.scan(/^\d{1,}/).join.to_i
		losses = total_record.scan(/-(\d{1,})-/).join.to_i
		Season.find(team.id).update_attributes(wins: wins, losses: losses)
	end

end
