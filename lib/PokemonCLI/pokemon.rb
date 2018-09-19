class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :type, :species, :height, :weight, :ability, :base_stats
  
  @@all = ["1. Bulbasaur", "2. Ivysaur"]
  
  def self.all 
    #puts "1. Bulbasaur"
    @@all 
  end 
  
  def self.create
    hash_1 = Scaper.new.add_num_and_name
    hash_2 = Scraper.new.add_additional_attributes
    
    pokemon = Pokemon.new 
    
    hash_1.each do |key, attribute|
      case key 
      when number 
      pokemon.number = attribute
      when name 
      pokemon.name = attribute 
      end
    end
    
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
      end
    end
    end
    @@all << pokemon
  end
  
end 