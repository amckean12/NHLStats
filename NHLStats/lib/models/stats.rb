class NHLStats::Stats

  attr_accessor :input_team

  def team_lookup
    puts "What Team?"
    puts "Type in the three letter abbreviation for team"
    puts "________________________________________________________________________________________________________________________________________________________"
    puts "Tampa Bay Lightning -- TBL || Toronto Maple Leafs -- TOR || Boston Bruins -- BOS || Detroit Red Wings -- DET || Florida Panthers -- FLA"
    puts "Montreal Canadiens -- MTL || Ottawa Senators -- OTT || Buffalo Sabres -- BUF || Philadelphia Flyers -- PHI || Washington Capitals -- WSH"
    puts "Pittsburg Penguins -- PIT || New Jersey Devils -- NJD || Columbus Blue Jackets -- CBJ || New York Islanders -- NYI || Carolina Hurricanes -- CAR "
    puts "New York Rangers -- NYR || Nashville Predators -- NSH || Winnipeg Jets -- WPG || Minnesota Wild -- MIN || Dallas Stars -- DAL || St. Louis Blues -- STL"
    puts "Colorado Avelanche -- COL || Chicago Blackhawks -- CHI || Vegas Golden Nights-- VEG || San Jose Sharks -- SJS || Anaheim Ducks -- ANA"
    puts "Los Angelas Kings -- LAK || Calgary Flames -- CGY || Edmonton Oilers-- EDM || Vancouver Canucks -- VAN || Arizona Coyotes -- ARI"
    puts "________________________________________________________________________________________________________________________________________________________"
    @input_team = gets.strip
    if team_id == true
      NHLStats::Scraper.new.run(@input_team)
    else
      puts "I'm Sorry, but you entered Team Name incorrectly"
      NHLStats::CLI.new.call
    end
    puts "_____________________________________________"
    puts "Would you like to Lookup another Team? (Yes to Continue No to Exit)"
    input = gets.strip
    if input == "Yes"
      team_lookup
    else
      abort  
    end
  end

  def team_id
    team_abr_array = ["ANA", "ARI", "BOS", "BUF", "CAR", "CBJ", "CGY", "CHI", "COL", "DAL", "DET", "EDM", "FLA", "LAK", "MIN", "MTL", "NJD", "NSH", "NYI", "NYR", "OTT", "PHI", "PIT", "SJS", "STL", "TBL", "TOR", "VAN", "VEG", "WPG", "WSH"]
    team_abr_array.include?(@input_team) ? true : false
  end


end
