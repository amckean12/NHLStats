class NHLStats::Stats

  attr_accessor :input_team

  def team_lookup(input)
    @input_team = input
    NHLStats::Scraper.new.run(@input_team)
    check_status
  end

  def check_status
    puts "____________________________________________________________________"
    puts "Would you like to Lookup another Team? (Yes to Continue No to Exit)"
    input = gets.strip
    input == "Yes" || input == "yes" ? NHLStats::CLI.new.call : abort
  end

end
