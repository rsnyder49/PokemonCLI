class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :type, :species, :height, :weight, :ability, :base_stats
  
  @@all = ["1. Bulbasaur", "2. Ivysaur"]
  
  def self.all 
    #puts "1. Bulbasaur"
    @@all 
  end 
  
  def self.create(pokemon_hash)
    pokemon = Pokemon.new 
    pokemon.number = 
    pokemon.name = 
    pokemon.type = 
    pokemon.species = 
    pokemon.height = 
    pokemon.weight = 
    pokemon.ability = 
    pokemon.base_stats = {:hp => 1, :attack => 1, :defense => 1, :specialAttack => 1, :specialDefense => 1, :speed => 1
    }
  end
  
end 