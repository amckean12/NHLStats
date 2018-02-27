class NHLStats::Scraper

  attr_accessor :stats

  def run(input)
    @stats = []
    if input == "blues" then team_stats_info else player_stats_info end

  end

  def get_page
    page = Nokogiri::HTML(open("https://www.hockey-reference.com/leagues/NHL_2018_skaters.html"))
    page_table = page.css('.stats_table')
    page_table.css("table tr").each do |player|
      hockey_player = player.css(".left").css("[data-stat = 'player']").text
      player_age = player.css(".center").css("[data-stat = 'age']").text
      player_position = player.css(".center").css("[data-stat = 'pos']").text
      player_team = player.css(".left").css("[data-stat = 'team_id']").text
      player_games_played = player.css(".right").css("[data-stat = 'games_played']").text
      player_goals = player.css(".right").css("[data-stat = 'goals']").text
      player_assists = player.css(".right").css("[data-stat = 'assists']").text
      player_points = player.css(".right").css("[data-stat = 'points']").text
      player_plus_minus = player.css(".right").css("[data-stat = 'plus_minus']").text
      player_penalty_minutes = player.css(".right").css("[data-stat = 'pen_min']").text
      player_shooting_percentage = player.css(".right").css("[data-stat = 'shot_pct']").text
      player_toi_avg = player.css(".right").css("[data-stat = 'time_on_ice_avg']").text
      player_blocks = player.css(".right").css("[data-stat = 'blocks']").text
      player_hits = player.css(".right").css("[data-stat = 'hits']").text
      player_faceoff_percentage = player.css(".right").css("[data-stat = 'faceoff_percentage']").text
      @stats << {player: hockey_player, age: player_age, position: player_position, team: player_team, games_played: player_games_played, goals: player_goals, assists: player_assists, points: player_points, shooting_percentage: player_shooting_percentage, plus_minus: player_plus_minus, penalty_minutes: player_penalty_minutes, TOI_Avg: player_toi_avg, blocks: player_blocks, hits: player_hits, faceoff_percentage: player_faceoff_percentage}
    end
    @stats
  end

  def team_stats_info
    get_page
    @stats.each do |team|
      if team[:team] == "STL"
        puts "_____________________________________________"
        puts "#{team[:player]} Age:#{team[:age]} Position:#{team[:position]}"
        puts "Games Played: #{team[:games_played]}"
        puts "Goals: #{team[:goals]}"
        puts "Assists: #{team[:assists]}"
        puts "Points: #{team[:points]}"
        puts "Shooting Percentage: #{team[:shooting_percentage]}"
        puts "Plus Minus: #{team[:plus_minus]}"
        puts "Penalty Minutes: #{team[:penalty_minutes]}"
        puts "Average TOI: #{team[:TOI_Avg]}"
        puts "Blocks: #{team[:blocks]}"
        puts "Hits: #{team[:hits]}"
        puts "Faceoff Percentage: #{team[:faceoff_percentage]}"
      end
    end
  end

  def player_stats_info
    get_page
    @stats.each do |player|
      if player[:player] == "Vladimir Tarasenko"
        puts "_____________________________________________"
        puts "#{player[:player]} Age:#{player[:age]} Position:#{player[:position]}"
        puts "Games Played: #{player[:games_played]}"
        puts "Goals: #{player[:goals]}"
        puts "Assists: #{player[:assists]}"
        puts "Points: #{player[:points]}"
        puts "Shooting Percentage: #{player[:shooting_percentage]}"
        puts "Plus Minus: #{player[:plus_minus]}"
        puts "Penalty Minutes: #{player[:penalty_minutes]}"
        puts "Average TOI: #{player[:TOI_Avg]}"
        puts "Blocks: #{player[:blocks]}"
        puts "Hits: #{player[:hits]}"
        puts "Faceoff Percentage: #{player[:faceoff_percentage]}"
      end
    end
  end

end
