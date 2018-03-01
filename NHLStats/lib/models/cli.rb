class NHLStats::CLI

  attr_accessor :input

  def call
    puts "Welcome to NHL Stats"
    puts "A Simple tool to pull NHL stats quickly"
    puts "_____________________________________________"
    puts "Controls"
    puts "To End Program: End"
    puts "To pick team: Three Letter team Abbreviation (IE: STL)"
    puts "_____________________________________________"
    list_teams
    start
  end

  def start
    @input = gets.strip
    valid_input? == true ? NHLStats::Stats.new.team_lookup(@input) : check_end?
  end

  def valid_input?
    team_abr_array = ["ANA", "ARI", "BOS", "BUF", "CAR", "CBJ", "CGY", "CHI", "COL", "DAL", "DET", "EDM", "FLA", "LAK", "MIN", "MTL", "NJD", "NSH", "NYI", "NYR", "OTT", "PHI", "PIT", "SJS", "STL", "TBL", "TOR", "VAN", "VEG", "WPG", "WSH"]
    team_abr_array.include?(@input) ? true : false
  end

  def check_end?
    @input == "End" || @input == "end" ? abort : call
  end

  def list_teams
    puts "Type in the three letter abbreviation for team"
    puts "________________________________________________________________________________________________________________________________________________________"
    puts "Tampa Bay Lightning -- TBL || Toronto Maple Leafs -- TOR || Boston Bruins -- BOS || Detroit Red Wings -- DET || Florida Panthers -- FLA"
    puts "Montreal Canadiens -- MTL || Ottawa Senators -- OTT || Buffalo Sabres -- BUF || Philadelphia Flyers -- PHI || Washington Capitals -- WSH"
    puts "Pittsburg Penguins -- PIT || New Jersey Devils -- NJD || Columbus Blue Jackets -- CBJ || New York Islanders -- NYI || Carolina Hurricanes -- CAR "
    puts "New York Rangers -- NYR || Nashville Predators -- NSH || Winnipeg Jets -- WPG || Minnesota Wild -- MIN || Dallas Stars -- DAL || St. Louis Blues -- STL"
    puts "Colorado Avelanche -- COL || Chicago Blackhawks -- CHI || Vegas Golden Nights-- VEG || San Jose Sharks -- SJS || Anaheim Ducks -- ANA"
    puts "Los Angelas Kings -- LAK || Calgary Flames -- CGY || Edmonton Oilers-- EDM || Vancouver Canucks -- VAN || Arizona Coyotes -- ARI"
    puts "________________________________________________________________________________________________________________________________________________________"
  end

end
