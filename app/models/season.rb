YEARS = ["2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004"]

class Season < ActiveRecord::Base
	belongs_to :team

	def self.find_composite
		collection_of_seasons = Season.order(year: :asc).each_slice(32).to_a
		collection_of_seasons.each do |season|
			Season.calculate_offense(season)
			Season.calculate_defense(season)
		end
	end

	def self.calculate_offense(season)
		season.sort
		# .order(avg_offense: :asc)
	end

	def self.calculate_defense(season)
		season.order(avg_defense: :desc)
	end

# Take total off and assign best team number 32 and worst team number 1.
# Order database by years.
# Put set of 32 seasons into each year.
# Order from best to worst offense.
# 
# Take total def and assign best team number 32 and worst team number 1.
# Add these numbers together per team per season.
# Multiply this value by the teams win pct.
# Result is the composite value.

	def self.populate_data
		Season.find_urls
	end

	private

	def self.find_urls
		urls = []
		YEARS.each do |year|
			urls << Nokogiri.parse(HTTParty.get("http://espn.go.com/nfl/standings/_/year/#{year}/group/1"))
		end
		Season.parse_each_url(urls)
	end

	def self.parse_each_url(urls)
		Team.all.each do |team|
			urls.each do |url|
				data = url.search('.h2').inner_text
				year = data.scan(/\d{4}/).join
				Season.find_home_win_loss(url, team, year)
			end
		end
	end

	def self.find_home_win_loss(doc, team, year)
		if doc.search(".#{team.espn_id} a").inner_text == team.name
			total_record = doc.search(".#{team.espn_id} td:nth-child(6)").inner_text
			Season.save_home_record(total_record, year, team)
		end
	end

	def self.save_home_record(total_record, year, team)
		wins = total_record.scan(/^\d{1,}/).join.to_i
		losses = total_record.scan(/-(\d{1,})-/).join.to_i
		total_games = wins + losses
		win_pct = (wins).to_f / (total_games).to_f
		Season.create(wins: wins, losses: losses, year: year, team_id: team.id, win_pct: win_pct)
	end

end
