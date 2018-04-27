class Player
    attr_accessor :player, :age, :position, :team, :games_played, :goals, :assists, :points, :shooting_percentage, :plus_minus, :penalty_minutes, :toi_avg, :blocks, :hits, :faceoff_percentage
    @@all = []

    def initialize(player_hash)
      player_hash.each do |attribute_name, value|
        self.send("#{attribute_name.downcase}=", value)
      end
      # consider using #each to iterage thorugh the player_hash and assign attributes
      @@all << self
    end

    # Player.all => return all the players
    def self.all
      @@all
    end

    def self.find_by_name(name)
      all.detect{|player| player.player.upcase== name.upcase}
    end

end
