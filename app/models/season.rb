YEARS = ["2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004"]

class Season < ActiveRecord::Base
	belongs_to :team

	def self.return_all_composites
		composites = []
		sorted_seasons = Season.all.order(year: :asc).each_slice(32).to_a # A nested array of 10 seasons
		seasons_sorted_by_team = sorted_seasons.each do |season|
			season.sort! { |a,b| a.team_id <=> b.team_id } # Sorts the nested array of 10 seasons by team_id
		end
		seasons_sorted_by_team.each do |year|
			year.each_with_index do |season, index|
				composites << season.composite.to_f.round(2)
			end
		end
		divided_seasons = composites.each_slice(32).to_a
		divided_years = divided_seasons.each_slice(10).to_a
	end

	def self.avg_composites
		avg_composites = []
		team_names = []
		32.times do |number|
			avg_composites << Season.where(team_id: number + 1).average(:composite).to_f.round(2)
			team_names << Season.find_by(team_id: number + 1).team.name
		end
		teams_composites = avg_composites.zip(team_names).sort_by(&:first)
		teams_composites.reverse.each_slice(16).to_a
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
