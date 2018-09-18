class PokemonCLI::Scraper
  
  #method will scrape data from a url. will add name and num attributes
  def get_page
    html = File.read("https://pokemondb.net/pokedex/all")
    poke_dex = Nokogiri::HTML(html)
    
    poke_dex_array = []
    
    poke_dex.css("div grid-col span-md-12 span-lg-10").each do |pokemon| 
      
  end 
end 