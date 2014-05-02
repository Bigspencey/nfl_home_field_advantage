teams = ["Arizona", "Atlanta", "Baltimore", "Buffalo", "Carolina", "Chicago", "Cincinnati", "Cleveland", "Dallas",
				 "Denver", "Detroit", "Green Bay", "Houston", "Indianapolis", "Jacksonville", "Kansas City",
				 "Miami", "Minnesota", "New England", "New Orleans", "NY Giants", "NY Jets", "Oakland",
				 "Philadelphia", "Pittsburgh", "San Diego", "San Francisco", "Seattle", "St. Louis", "Tampa Bay",
				 "Tennessee", "Washington"]

mascots = ["Cardinals", "Falcons", "Ravens", "Bills", "Panthers", "Bears", "Bengals", "Browns", "Cowboys",
					 "Broncos", "Lions", "Packers", "Texans", "Colts", "Jaguars", "Chiefs", "Dolphins", "Vikings",
					 "Patriots", "Saints", "Giants", "Jets", "Raiders", "Eagles", "Steelers", "Chargers", "49ers",
					 "Seahawks", "Rams", "Buccaneers", "Titans", "Redskins"]

stadiums = ["University of Phoenix Stadium", "Georgia Dome", "M&T Bank Stadium", "Ralph Wilson Stadium",
						"Bank of America Stadium", "Soldier Field", "Paul Brown Stadium", "FirstEnergy Stadium",
						"AT&T Stadium", "Sports Authority Field at Mile High", "Ford Field", "Lambeau Field",
					  "NRG Stadium", "Lucas Oil Stadium", "EverBank Field", "Arrowhead Stadium", "Sun Life Stadium",
					  "TCF Bank Stadium", "Gillette Stadium", "Mercedes-Benz Superdome", "MetLife Stadium", "MetLife Stadium",
						"O.co Coliseum", "Lincoln Financial Field", "Heinz Field", "Qualcomm Stadium", "Levi's Stadium",
						"CenturyLink Field", "Edward Jones Dome", "Raymond James Stadium", "LP Field", "FedEx Field"]

espn = ["team-28-22", "team-28-1", "team-28-33", "team-28-2", "team-28-29", "team-28-3", "team-28-4", "team-28-5",
				"team-28-6", "team-28-7", "team-28-8", "team-28-9", "team-28-34", "team-28-11", "team-28-30", "team-28-12",
				"team-28-15", "team-28-16", "team-28-17", "team-28-18", "team-28-19", "team-28-20", "team-28-13", "team-28-21",
				"team-28-23", "team-28-24", "team-28-25", "team-28-26", "team-28-14", "team-28-27", "team-28-10", "team-28-28"]

years = ["2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004"]

start_date = ["2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005"]

teams.each_with_index do |team, index|
	Team.create(name: team, mascot: mascots[index], stadium_name: stadiums[index], espn_id: espn[index])
end

CSV.foreach("lib/assets/total_offense.csv") do |row|
	if row[0] == Season.find_by_ && row[2] == Season.where(year: row[2])
		Season.update_attributes(avg_offense: row[1])
	end
end

CSV.foreach("lib/assets/total_defense.csv") do |row|
	Season.update_attributes(avg_defense: row[1])
end
