require 'nokogiri'
require 'open-uri'

class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :type, :species, :height, :weight, :ability, :base_stats
  
  @@all = []
  
  def self.all 
    @@all 
  end 
  
  def self.create_all
    array_1 = Scaper.new.add_num_and_name
    
    c = 0
    until count == 807
    pokemon = Pokemon.new 
    
    array_1.each do |ele|
      pokemon.number = ele
      pokemon.name = ele + 1
      c += 1 
      @@all << pokemon

    
  def get_attributes(name)
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/#{name}"))
      
    #hash_2.each do |key, attribute|
      #case key 
      #when type
      doc.css()
      pokemon.type = doc.search('tr td a')[0].text
      pokemon.type += "/#{doc.search('tr td a')[1].text}"
      pokemon.species = doc.search('tr td')[2].text
      pokemon.height = doc.search('tr td')[3].text
      pokemon.weight = doc.search('tr td')[4].text 
      pokemon.abilities = doc.search('tr td a')[2].text
      pokemon.abilites += "/#{doc.search('tr td a')[2].text}(Hidden Ability)"
      when base_stats 
        base_stats.each do |stat|
        pokemon.base_stats = {:hp => 1, :attack => 1, :defense => 1, :specialAttack => 1, :specialDefense => 1, :speed => 1, :total => 1
      }
      end #end array_1
        end #end base_stats
      end #end case 
    end #end hash_2
    @@all << pokemon
  end
  
end 

#type: doc.search('tr td a')[0].text ......[1]
#species: doc.search('tr td')[2].text
#abilities doc.search('tr td a')[2].text ........doc.search('tr td a')[3].text (hidden ability)
#height: doc.search('tr td')[3].text
#weight: doc.search('tr td')[4].text
#hp tr td[15], attack[19] defense[23], spcAttack[27], spcDefense[31], speed[35], total[39]