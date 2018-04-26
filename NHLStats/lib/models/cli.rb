class NHLStats::CLI

  attr_accessor :input

  TEAM_ABR_ARRAY = ["ANA", "ARI", "BOS", "BUF", "CAR", "CBJ", "CGY", "CHI", "COL", "DAL", "DET", "EDM", "FLA", "LAK", "MIN", "MTL", "NJD", "NSH", "NYI", "NYR", "OTT", "PHI", "PIT", "SJS", "STL", "TBL", "TOR", "VAN", "VEG", "WPG", "WSH"]

  def call
    initial_welcome
    list_teams
    start
  end

  def start
    @input = gets.strip.upcase
    if @input != "END" && valid_team? == true
      puts "Loading Your Results ...."
      @scraper = HockeyScraper.new(@input)
      @scraper.scrape_page
      get_player
    elsif valid_team? == false && @input != "END"
      puts "I'm Sorry You may have entered and incorrect Team Code."
      puts "Please Try Again"
      call
    elsif @input.upcase == "END"
      abort
    end
  end

  def initial_welcome
    puts "Welcome to NHL Stats"
    puts "A Simple tool to pull NHL stats quickly"
    puts "_____________________________________________"
    puts "Controls"
    puts "To End Program: End"
    puts "To pick team: Three Letter team Abbreviation (IE: STL)"
    puts "_____________________________________________"
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

  def get_player
    puts "Which Player would you like to get stats for?"
    @input = gets.strip
    unless @input.upcase == "NO"
      @scraper.display_results(@input)
      puts "To Select another Player Type that Players name if not type no."
      @input = gets.strip
    end
    another_team?
  end


  def valid_team?
    TEAM_ABR_ARRAY.include?(@input) ? true : false
  end

  def another_team?
    puts "Would you Like to view another Team's Players?(Yes or No to Exit)"
    @input = gets.strip
    if @input.upcase == "YES"
      puts "Which team Would you Like to view?"
      list_teams
      start
    elsif @input.upcase == "NO"
      abort
    else
      another_team?
    end
  end

end
