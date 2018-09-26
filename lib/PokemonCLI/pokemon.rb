require 'nokogiri'
require 'open-uri'

class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :type, :species, :height, :weight, :abilities
  
  @@all_pokemon = []
  
  def self.all_pokemon
    @@all_pokemon.uniq {|a| a.name}
  end 
  
  def self.get_all_page
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
  end 
  
  def self.create_all
    get_all_page.css("tr").each do |a| 
      pokemon = self.new
      pokemon.number = a.css("span.infocard-cell-data").text
      pokemon.name = a.css("td a.ent-name").text
      @@all_pokemon << pokemon #unless @@all_pokemon.each {|a| a.number == pokemon.number}
    end
  end
    
  def self.get_attributes(pokemon_name)
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/#{pokemon_name}")) 
    pokemon = PokemonCLI::Pokemon.new
    pokemon.name = doc.search('h1').first.text
    pokemon.number = doc.search('tr td')[0].text
    pokemon.type = doc.search('tr td a')[0].text
    pokemon.type += "/#{doc.search('tr td a')[1].text}"
    pokemon.species = doc.search('tr td')[2].text
    pokemon.height = doc.search('tr td')[3].text
    pokemon.weight = doc.search('tr td')[4].text 
    pokemon.abilities = doc.search('tr td a')[2].text
    pokemon.abilities += "/#{doc.search('tr td a')[3].text}(Hidden Ability)"
    pokemon 
  end

end 

#name: doc.search('h1').first.text
#num: doc.search('tr td')[0].text
#type: doc.search('tr td a')[0].text ......[1]
#species: doc.search('tr td')[2].text
#abilities doc.search('tr td a')[2].text ........doc.search('tr td a')[3].text (hidden ability)
#height: doc.search('tr td')[3].text
#weight: doc.search('tr td')[4].text
#hp tr td[15], attack[19] defense[23], spcAttack[27], spcDefense[31], speed[35], total[39]