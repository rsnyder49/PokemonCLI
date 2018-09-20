class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :type, :species, :height, :weight, :ability, :base_stats
  
  @@all = ["1. Bulbasaur", "2. Ivysaur"]
  
  def self.all 
    @@all 
  end 
  
  def self.create_all
    array_1 = Scaper.new.add_num_and_name
    hash_2 = Scraper.new.add_additional_attributes
    
    c = 0
    until count = 807
    pokemon = Pokemon.new 
    
    array_1.each do |ele|
      pokemon.number = ele
      pokemon.name = ele + 1

    
    
    hash_2.each do |key, attribute|
      case key 
      when type
      pokemon.type = attribute
      when species 
      pokemon.species = attribute
      when height 
      pokemon.height = attribute
      when weight 
      pokemon.weight = attribute 
      when ability
      pokemon.ability = attribute 
      when base_stats 
        base_stats.each do |stat|
        pokemon.base_stats = {:hp => 1, :attack => 1, :defense => 1, :specialAttack => 1, :specialDefense => 1, :speed => 1
      }
      end #end array_1
        end #end base_stats
      end #end case 
    end #end hash_2
    @@all << pokemon
  end
  
end 