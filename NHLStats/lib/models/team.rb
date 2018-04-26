class Team
  attr_accessor :players, :player_input

  def initialize
    @players = []
  end

  def add_player(player_hash)
    @players << player_hash
    puts "#{player_hash[:player]}"
  end

  def get_players_stats(input)
    @player_input = input
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
