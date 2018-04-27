class Team
  attr_accessor :players, :abbr


  @@all = []

  def initialize(team_abbr)
    @players = []
    @abbr = team_abbr
  end

  def self.all
    @@all
  end

  def self.find_by_abbr(input)
    all.detect {|team| team.abbr == input}
  end


  def add_player(player_hash)
    player = Player.new(player_hash)
    @players << player
  end

  def get_players_stats(input)
    player_input = input
    if @players.find {|p| p[:player] == @player_input} == nil
      puts "____________________________________________________________________"
      puts "********I'm Sorry you may have mispelled the players name.**********"
      puts "****************Or picked a player that is not on the Team.*********"
      puts "*******Please check the above list to ensure correct spelling.******"
      puts "____________________________________________________________________"
    else
      player_hash = @players.find{|p| p[:player] == @player_input}
      player = Player.new(player_hash).stat_display
      player
    end
  end
end
