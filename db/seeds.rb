Owner.create!([
  {name: "Eric", franchise: "Flyers", team_id: nil},
  {name: "Lindsay", franchise: "United", team_id: nil},
  {name: "Brett", franchise: "River Rats", team_id: nil},
  {name: "Rickey", franchise: "Buccaneers", team_id: nil},
  {name: "Andy", franchise: "Rudys", team_id: nil},
  {name: "Taylor", franchise: "Red Wings", team_id: nil},
  {name: "Tarin", franchise: "Chaos", team_id: nil},
  {name: "Joe", franchise: "Villains", team_id: nil},
  {name: "Zach", franchise: "Menaces", team_id: nil},
  {name: "Alex", franchise: "Pool Cats", team_id: nil},
  {name: "Jordan", franchise: "Thrashers", team_id: nil},
  {name: "Tom", franchise: "Couch Burners", team_id: nil}
])

Team.create!([
  {first_name: "New York", last_name: "Yankees", short_name: "NYY", color_1: "#1c2841", color_2: "white", color_3: "silver"},
  {first_name: "Boston", last_name: "Red Sox", short_name: "BOS", color_1: "#C60c30", color_2: "white", color_3: "#002244"},
  {first_name: "Baltimore", last_name: "Orioles", short_name: "BAL", color_1: "#222222", color_2: "#FB4F14", color_3: "#FFFFFF"},
  {first_name: "Toronto", last_name: "Blue Jays", short_name: "TOR", color_1: "#003DA5", color_2: "white", color_3: "#041E42"},
  {first_name: "Tampa Bay", last_name: "Rays", short_name: "TB", color_1: "#00285D", color_2: "#9eceee", color_3: "white"},
  {first_name: "Chicago", last_name: "White Sox", short_name: "CHW", color_1: "#222222", color_2: "silver", color_3: "white"},
  {first_name: "Detroit", last_name: "Tigers", short_name: "DET", color_1: "#001742", color_2: "white", color_3: "#de4406"},
  {first_name: "Cleveland", last_name: "Indians", short_name: "CLE", color_1: "#003366", color_2: "#C80810", color_3: "#FFFFFF"},
  {first_name: "Kansas City", last_name: "Royals", short_name: "KC", color_1: "#15317E", color_2: "#74B4FA", color_3: "white"},
  {first_name: "Minnesota", last_name: "Twins", short_name: "MIN", color_1: "#072754", color_2: "#c6011f", color_3: "white"},
  {first_name: "Oakland", last_name: "Athletics", short_name: "OAK", color_1: "#003831", color_2: "#FFD800", color_3: "white"},
  {first_name: "Seattle", last_name: "Mariners", short_name: "SEA", color_1: "#0c2c56", color_2: "#005c5c", color_3: "silver"},
  {first_name: "Texas", last_name: "Rangers", short_name: "TEX", color_1: "#BD1021", color_2: "#ffffff", color_3: "#003279"},
  {first_name: "Los Angeles", last_name: "Angels", short_name: "LAA", color_1: "#B71234", color_2: "#002244", color_3: "white"},
  {first_name: "Chicago", last_name: "Cubs", short_name: "CHC", color_1: "#003366", color_2: "#CC0033", color_3: "white"},
  {first_name: "Pittsburgh", last_name: "Pirates", short_name: "PIT", color_1: "#222222", color_2: "#ffbf00", color_3: "white"},
  {first_name: "Cincinnati", last_name: "Reds", short_name: "CIN", color_1: "#c6011f", color_2: "white", color_3: "#222222"},
  {first_name: "St. Louis", last_name: "Cardinals", short_name: "STL", color_1: "#C41E3A", color_2: "#0A2252", color_3: "white"},
  {first_name: "Houston", last_name: "Astros", short_name: "HOU", color_1: "#062854", color_2: "#FF7F29", color_3: "#FFFFFF"},
  {first_name: "Milwaukee", last_name: "Brewers", short_name: "MIL", color_1: "#182B49", color_2: "#92754C", color_3: "white"},
  {first_name: "Arizona", last_name: "Diamondbacks", short_name: "ARI", color_1: "#A71930", color_2: "#222222", color_3: "#DBCEAC"},
  {first_name: "San Francisco", last_name: "Giants", short_name: "SF", color_1: "#222222", color_2: "#F2552C", color_3: "#FFFDD0"},
  {first_name: "Colorado", last_name: "Rockies", short_name: "COL", color_1: "#222222", color_2: "#333366", color_3: "silver"},
  {first_name: "San Diego", last_name: "Padres", short_name: "SD", color_1: "#002147", color_2: "white", color_3: "#B4A76C"},
  {first_name: "Los Angeles", last_name: "Dodgers", short_name: "LA", color_1: "#083c6b", color_2: "#fff", color_3: nil},
  {first_name: "Atlanta", last_name: "Braves", short_name: "ATL", color_1: "#002F5F", color_2: "#B71234", color_3: "white"},
  {first_name: "Philadelphia", last_name: "Phillies", short_name: "PHI", color_1: "#BA0C2F", color_2: "#003087", color_3: nil},
  {first_name: "New York", last_name: "Mets", short_name: "NYM", color_1: "#002C77", color_2: "#FB4F14", color_3: "white"},
  {first_name: "Miami", last_name: "Marlins", short_name: "MIA", color_1: "#222222", color_2: "#E74A33", color_3: "#007BB2"},
  {first_name: "Washington", last_name: "Nationals", short_name: "WAS", color_1: "#ba122b", color_2: "#11225b", color_3: "white"}
])

Team.all.each do |t|
  Result.create!(team_id: t.id, position: nil)
end
