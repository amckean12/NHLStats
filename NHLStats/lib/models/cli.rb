class NHLStats::CLI
  def call
    puts "Welcome to NHL Stats"
    puts "A Simple tool to pull NHL stats quickly"
    puts "_____________________________________________"
    puts "Type Team to pull up all of the Available Teams"
    puts "Type End to exit the program."
    puts "_____________________________________________"
    puts "Input Here:"
    start
  end

  def start
    input = nil
    input = gets.strip
    NHLStats::Stats.new.team_lookup if input == "Team" if input == "Team"
  end

end
