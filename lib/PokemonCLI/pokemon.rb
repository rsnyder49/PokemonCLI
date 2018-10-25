class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :info, :type, :species, :height, :weight, :abilities
  
  @@all_pokemon = []

  def self.all_pokemon
    @@all_pokemon 
  end 

end 