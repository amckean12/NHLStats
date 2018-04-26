class Player
    attr_accessor :player_hash, :name, :age, :position, :team, :games_played, :goals, :assists, :points, :shooting_percentage, :plus_minus, :penalty_minutes, :toi_avg, :blocks, :hits, :faceoff_percentage

    def initialize(player_hash)
      @player_hash = player_hash
    end

    def stat_display
      puts "____________________________________________________________________"
        puts "#{self.name} Age:#{self.age} Position:#{self.position}"
        puts "Team:#{self.team}"
        puts "Games Played: #{self.games_played}"
        puts "Goals: #{self.goals}"
        puts "Assists: #{self.assists}"
        puts "Points: #{self.points}"
        puts "Shooting Percentage: #{self.shooting_percentage}"
        puts "Plus Minus: #{self.plus_minus}"
        puts "Penalty Minutes: #{self.penalty_minutes}"
        puts "Average TOI: #{self.toi_avg}"
        puts "Blocks: #{self.blocks}"
        puts "Hits: #{self.hits}"
        puts "Faceoff Percentage: #{self.faceoff_percentage}"
        puts "____________________________________________________________________"
    end



    def name
      @player_hash[:player]
    end

    def age
      @player_hash[:age]
    end

    def position
      @player_hash[:position]
    end

    def team
      @player_hash[:team]
    end

    def games_played
      @player_hash[:games_played]
    end

    def goals
      @player_hash[:goals]
    end

    def assists
      @player_hash[:assists]
    end

    def points
      @player_hash[:points]
    end

    def shooting_percentage
      @player_hash[:shooting_percentage]
    end

    def plus_minus
      @player_hash[:plus_minus]
    end

    def penalty_minutes
      @player_hash[:penalty_minutes]
    end

    def toi_avg
      @player_hash[:toi_avg]
    end

    def hits
      @player_hash[:hits]
    end

    def blocks
      @player_hash[:blocks]
    end

    def faceoff_percentage
      @player_hash[:faceoff_percentage]
    end

end
