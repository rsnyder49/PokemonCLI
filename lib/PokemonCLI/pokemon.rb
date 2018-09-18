class PokemonCLI::Pokemon 
  @@all = []
  
  def self.all 
    puts "1. Bulbasaur"
    @@all 
  end 
  
  def self.creat(pokemon_hash)
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