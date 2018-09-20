require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  attr_accessor :number, :name
  
  def initialize
    get_all_page
    add_num_and_name
    get_pokemon_page
    add_additional_attributes
  end 
  
  def get_all_page
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
    doc
    
  end 
  
  def add_num_and_name
    poke_dex = []
    
    get_all_page.css("tr").each do |pokemon| 
      poke_dex << pokemon.css("span.infocard-cell-data").text
      poke_dex << pokemon.css("td.cell-name").text
      
    end
    poke_dex.reject{|a| a.empty?}
  end
 
  def self.get_pokemon_page
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
    doc.css("tr").each do |url|
      
  end
  
  def self.add_additional_attributes
    
  end
  
end
s = Scraper.new
s.add_num_and_name
