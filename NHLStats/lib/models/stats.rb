class NHLStats::Stats

  attr_accessor :player, :age, :position, :team, :games_played, :goals, :assists, :points, :plus_minus, :penalty_minutes, :shooting_percentage, :toi_avg, :blocks, :hits, :faceoff_percentage

  def player_lookup
    NHLStats::Scraper.new.run(input)
  end

  def team_lookup
    puts "What Team?"
    input = gets.strip
    NHLStats::Scraper.new.run(input)
  end

end
