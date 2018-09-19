require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  attr_accessor :number, :name
  
  def initialize
    get_all_page
    add_num_and_name
  end 
  
  def get_all_page
    # html = File.read("https://pokemondb.net/pokedex/all")
    # poke_dex = Nokogiri::HTML(html)
    # doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/national"))
    doc
    
  end 
  
  def add_num_and_name
    poke_dex_hash = {}
    
    get_all_page.css("tbody").each do |pokemon| 
    #   poke_dex_hash[:number] = pokemon.css("span.infocard-cell-data").text
      poke_dex_hash[:name] = pokemon.css("tr td.cell-name a.ent-name").text
      
    end
    poke_dex_hash
  end
  binding.pry
  def self.get_pokemon_page
    
  end
  
  def self.add_additional_attributes
    
  end
  
end
s = Scraper.new
s.add_num_and_name
