class NHLStats::CLI
  def call
    puts "Welcome to NHL Stats"
    puts "A Simple tool to pull NHL stats quickly"
    puts "_____________________________________________"
    puts "Type Teams to display the current NHL Teams"
    puts "Type End to exit the program."
    puts "_____________________________________________"
    puts "Input Here:"
    start
  end

  def start
    input = nil
    input = gets.strip
    NHLStats::Stats.new.team_lookup if input == "Teams"
    abort if input == "End"
  end

end
