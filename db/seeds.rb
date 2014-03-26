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

years = ["2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"]

teams.each_with_index do |team, index|
	Team.create(name: team, mascot: mascots[index], stadium_name: stadiums[index])
end

years.each do |year|
	Year.create(year: year)
end

mascots.each_with_index do |mascot, index|
	years.each do |year|
		Season.create(team_id: index, year_id: year)
	end
end




