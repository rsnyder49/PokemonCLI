class PokemonCLI::Pokemon 
  attr_accessor :number, :name, :info, :type, :species, :height, :weight, :abilities
  
  @@all_pokemon = []
  
  def initialize 
    @@all_pokemon << self
  end 
  
  def self.all_pokemon
    @@all_pokemon 
  end 

end 