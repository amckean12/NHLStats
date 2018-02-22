class NHLStats::Scraper

  def get_page
    page = Nokogiri::HTML(open("https://www.hockey-reference.com/leagues/NHL_2018_skaters.html"))
    page_table = page.css('.stats_table')
    rows = page_table.css("table tr")
    binding.pry
  end

end
