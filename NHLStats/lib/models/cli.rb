class NHLStats::CLI
  def call
    puts "Welcome to NHL Stats"
    puts "A Simple tool to pull NHL stats quickly"
    puts "______________________________________________________________"
    puts "1. Type in a team name to pull stats of every player"
    puts "2. Type in a specific Player to pull stats on them"
    puts "3. Type in Leaders to pull the current stat leaders"
    puts "______________________________________________________________"
    puts "Input Here:"
    start
  end

  def start
    NHLStats::Scraper.new.get_page
  end



end
