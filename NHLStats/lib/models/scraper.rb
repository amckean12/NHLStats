class NHLStats::Scraper

  attr_accessor :stats

  def run(input)
    @stats = []
    team_stats_info if input == "blues"
    player_stats_info if input == "tarasenko"
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
        puts "#{team[:player]}"
      end
    end
  end

  def player_stats_info
  end

end
