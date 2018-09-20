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
    poke_dex.reject{|a| a.empty?} #need to also remove duplicates 
  end
 
  def self.get_pokemon_page
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
    url_array = []
    doc.css("tr td.cell-name").each do |pokemon|
      url_array << pokemon.css("a.ent-name").first.attr("href")
    end
    url_array
  end
  binding.pry 
  def self.add_additional_attributes
    get_pokemon_page.each do |page|
      doc = Nokogiri::HTML(open(page))
      doc.css()
      #get attributes 
    end
  end
  
end
# doc.css('tr td.cell-name').each do |p| 
#   puts "p.css('a.ent-name').first.attr('href')}""
# end