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
					  "TCF Bank Stadium", "Gillette Stadium", "Mercedes-Benz Superdome", "MetLife Stadium",
						"O.co Coliseum", "Lincoln Financial Field", "Heinz Field", "Qualcomm Stadium", "Levi's Stadium",
						"CenturyLink Field", "Edward Jones Dome", "Raymond James Stadium", "LP Field", "FedEx Field"]

# teams.each do |name|
# 	Team.create(name: name)
# end

# mascots.each do |mascot|
# 	Team.update_attributes(mascot: mascot)
# end

# stadiums.each do |stadium|
# 	Team.update_attributes(stadium_name: stadium)
# end

32.times do |i|
	Team.create(name: teams[i], mascot: mascots[i], stadium_name: stadiums[i])
end