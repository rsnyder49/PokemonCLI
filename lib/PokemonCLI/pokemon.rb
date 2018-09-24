require 'nokogiri'
require 'open-uri'

class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :type, :species, :height, :weight, :ability, :base_stats
  
  @@all = []
  
  def self.all 
    @@all 
  end 
  
  def create_all
    array_1 = PokemonCLI::Scraper.new.add_num_and_name
    
    count = 0
    until count == 807
      pokemon = self.new 
    
      array_1.each do |ele|
        pokemon.number = ele
        pokemon.name = ele + 1
        count += 1 
        @@all << pokemon
      end
    end
  end

    
  def get_attributes(name)
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/#{name}"))
      
    pokemon.type = doc.search('tr td a')[0].text
    pokemon.type += "/#{doc.search('tr td a')[1].text}"
    pokemon.species = doc.search('tr td')[2].text
    pokemon.height = doc.search('tr td')[3].text
    pokemon.weight = doc.search('tr td')[4].text 
    pokemon.abilities = doc.search('tr td a')[2].text
    pokemon.abilites += "/#{doc.search('tr td a')[2].text}(Hidden Ability)"
  end

end 

#type: doc.search('tr td a')[0].text ......[1]
#species: doc.search('tr td')[2].text
#abilities doc.search('tr td a')[2].text ........doc.search('tr td a')[3].text (hidden ability)
#height: doc.search('tr td')[3].text
#weight: doc.search('tr td')[4].text
#hp tr td[15], attack[19] defense[23], spcAttack[27], spcDefense[31], speed[35], total[39]