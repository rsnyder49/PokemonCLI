require 'pry'
require 'nokogiri'
require 'open-uri'

class PokemonCLI::Scraper
  attr_accessor :number, :name
  
  # def initialize
  #   get_all_page
  #   add_num_and_name
  # end 
  
  def self.get_all_page
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
    doc
  end 
  
  def self.add_num_and_name
    poke_dex = []
    pokemon = PokemonCLI::Pokemon.new
    get_all_page.css("tr").each do |a| 
      pokemon.number = a.css("span.infocard-cell-data").text
      pokemon.name = a.css("td.cell-name").text
      poke_dex << pokemon 
    end
    poke_dex.reject{|a| a.empty?} #need to also remove duplicates 
  end
 
  # def self.get_pokemon_page
  #   doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
  #   url_array = []
  #   doc.css("tr td.cell-name").each do |pokemon|
  #     url_array << "https://pokemondb.net#{pokemon.css("a.ent-name").first.attr("href")}"
  #   end
  #   url_array
  # end
  
  # def self.add_additional_attributes
  #   get_pokemon_page.each do |page|
  #     doc = Nokogiri::HTML(open(page))
  #     doc.css()
  #     #get attributes 
  #   end
  # end
  
end

#name: doc.search('h1').first.text
#num: doc.search('tr td')[0].text
#type: doc.search('tr td a')[0].text ......[1]
#species: doc.search('tr td')[2].text
#abilities doc.search('tr td a')[2].text ........doc.search('tr td a')[3].text (hidden ability)
#height: doc.search('tr td')[3].text
#weight: doc.search('tr td')[4].text
#hp tr td[15], attack[19] defense[23], spcAttack[27], spcDefense[31], speed[35], total[39]
