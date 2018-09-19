require 'pry'

class Scraper
  
  #method will scrape data from a url. will add name and num attributes
  def get_page
    html = File.read("https://pokemondb.net/pokedex/all")
    poke_dex = Nokogiri::HTML(html)
  end 
  
  def self.add_num_and_name
    poke_dex_hash = {}
    
    get_page.css("div grid-col span-md-12 span-lg-10").each do |pokemon| 
      poke_dex_hash[:number] = pokemon.css("span infocard-cell-data").text
      #poke_dex_hash[:name] = pokemon.css("td cell-name a ent-name").text
      binding.pry
    end
    poke_dex_hash
  end
  
  def add_additional_attributes 
  end
  
end 