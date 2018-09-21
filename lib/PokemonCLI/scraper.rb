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
      url_array << "https://pokemondb.net#{pokemon.css("a.ent-name").first.attr("href")}"
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

#type: doc.search('tr td a')[0].text ......[1]
#species: doc.search('tr td')[2].text
#abilities doc.search('tr td a')[2].text ........doc.search('tr td a')[3].text (hidden ability)
#height: doc.search('tr td')[3].text
#weight: doc.search('tr td')[4].text
#hp tr td[15], attack[19] defense[23], spcAttack[27], spcDefense[31], speed[35], total[39]
