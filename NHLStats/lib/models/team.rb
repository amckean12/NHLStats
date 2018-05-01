class Team
  attr_accessor :players, :abbr

  @@all = []

  def initialize(team_abbr)
    @players = []
    @abbr = team_abbr
    @@all << self
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
end
