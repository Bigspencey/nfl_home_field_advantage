YEARS = ["2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004"]

class Season < ActiveRecord::Base
	belongs_to :team

	def self.return_composites(year)
		composites = []
		correct_season = Season.where(year: year)
		sorted_season = correct_season.find(:all, include: :team, order: 'teams.name')
		sorted_season.each do |season|
			composites << season.composite.to_f.round(2)
		end
		composites
	end

	def self.find_composite
		collection_of_seasons = Season.order(year: :asc).each_slice(32).to_a
		collection_of_seasons.each do |season|
			off_counter = 1
			def_counter = 32
			Season.calculate_offense(season, off_counter)
			Season.calculate_defense(season, def_counter)
		end
		Season.calculate_composite
	end

	def self.populate_data
		Season.find_urls
	end

	private

	def self.calculate_offense(season, counter)
		sorted_offense = season.sort_by &:avg_offense
		sorted_offense.each do |team|
			correct_season = (Season.includes(:team).select do |season|
				season.team.id == team.team_id && season.year == team.year end).first
			if correct_season
				correct_season.update_attributes(off_rank: counter)
				counter += 1
			end
		end
	end

	def self.calculate_defense(season, counter)
		sorted_defense = season.sort_by &:avg_defense
		sorted_defense.each do |team|
			correct_season = (Season.includes(:team).select do |season|
				season.team.id == team.team_id && season.year == team.year end).first
			if correct_season
				correct_season.update_attributes(def_rank: counter)
				counter -= 1
			end
		end
	end

	def self.calculate_composite
		Season.all.each do |season|
			composite = (season.off_rank.to_f + season.def_rank.to_f) * season.win_pct.to_f
			season.update_attributes(composite: composite)
		end
	end

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
