class NHLStats::CLI
  attr_accessor :input

  TEAM_ABR_ARRAY = ["ANA", "ARI", "BOS", "BUF", "CAR", "CBJ", "CGY", "CHI", "COL", "DAL", "DET", "EDM", "FLA", "LAK", "MIN", "MTL", "NJD", "NSH", "NYI", "NYR", "OTT", "PHI", "PIT", "SJS", "STL", "TBL", "TOR", "VAN", "VEG", "WPG", "WSH"]

  def call
    initial_welcome
    list_teams
    start
  end

  def check_end_of_program(input)
    abort if input.upcase == "END" || input.upcase == "NO"
  end

  #Run's the program (There is an exit point at the end of this method)
  def start
    @input = gets.strip.upcase
    while valid_team?(@input) == true
      puts "Loading Your Results ...."
      if  team = Team.find_by_abbr(@input)
        display_player_names(team)
      else
        #If the team obj is not present in the @@all team array for this session then we scrape the site to get those team's players
        @scraper = HockeyScraper.new(@input)
        display_player_names(@scraper.scrape_page)
      end
      get_player
    end
    check_end_of_program(@input)
    #Occurs when user enters in an incorreect team code
    puts "I'm Sorry You may have entered and incorrect Team Code."
    puts "Please Try Again"
    call
  end

  def display_player_names(team)
    team.players.each {|player| puts player.player}
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
    until @input == "NO"
      puts "Which Player would you like to get stats for?"
      @input = gets.strip
      show_player(@input)
      puts "Would you like to view another Player? (Yes or No)"
      @input = gets.strip.upcase
    end
    another_team?
  end


  def valid_team?(team_input)
    TEAM_ABR_ARRAY.include?(team_input) ? true : false
  end

  #An exit point for the program is in this method
  def another_team?
    puts "Would you Like to view another Team's Players?(Yes or No to Exit)"
    another_team_input = gets.strip.upcase
    check_end_of_program(another_team_input)
    puts "Which team Would you Like to view?"
    list_teams
    start
    another_team?
  end

  # once we've received the input for a player's name
  def show_player(name)
    if player = Player.find_by_name(name)
      puts "____________________________________________________________________"
        puts "#{player.player} Age:#{player.age} Position:#{player.position}"
        puts "Team:#{player.team}"
        puts "Games Played: #{player.games_played}"
        puts "Goals: #{player.goals}"
        puts "Assists: #{player.assists}"
        puts "Points: #{player.points}"
        puts "Shooting Percentage: #{player.shooting_percentage}"
        puts "Plus Minus: #{player.plus_minus}"
        puts "Penalty Minutes: #{player.penalty_minutes}"
        puts "Average TOI: #{player.toi_avg}"
        puts "Blocks: #{player.blocks}"
        puts "Hits: #{player.hits}"
        puts "Faceoff Percentage: #{player.faceoff_percentage}"
        puts "____________________________________________________________________"
    else
      raise_player_error
    end
  end

  def raise_player_error
    puts "____________________________________________________________________"
    puts "********I'm Sorry you may have mispelled the players name.**********"
    puts "****************Or picked a player that is not on the Team.*********"
    puts "*******Please check the above list to ensure correct spelling.******"
    puts "____________________________________________________________________"
    get_player
  end

end
