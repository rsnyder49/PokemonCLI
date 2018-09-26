class PokemonCLI::CLI  
  attr_accessor :name
  def start 
    puts "Welcome to the PokemonCLI!"
    list_pokemon
    menu
  end 
  
  def list_pokemon 
    PokemonCLI::Pokemon.create_all
    @all_pokemon = PokemonCLI::Pokemon.all_pokemon
    @all_pokemon.each do |pokemon|
      puts "#{pokemon.number}. #{pokemon.name}"
    end
  end 
  
  def menu
    input = ""
    while input != 'exit'
    
      puts "Please enter a Pokemon number to see additional information about that Pokemon or type 'list' to view the list of Pokemon or type 'exit' to close the program."
      
      input = gets.downcase.strip
      
      if input.to_i > 0 
        current_pokemon = @all_pokemon[input.to_i] 
        pokemon = PokemonCLI::Pokemon.get_attributes(current_pokemon.name)
        
        puts pokemon.name
        puts "Num: #{pokemon.number}"
        puts "Type: #{pokemon.type}"
        puts "Species: #{pokemon.species}" 
        puts "Height: #{pokemon.height}"
        puts "Weight: #{pokemon.weight}"
        puts "Abilities: #{pokemon.abilities}"
        puts "-----------------------"
        
      elsif input == "list"
        list_pokemon
      elsif input == 'exit' 
        good_bye
      else
        puts "I did not understand that input."
      end 
    end
  end
  
  def good_bye 
    puts "Thank you for using the PokemonCLI!"
  end 
  
end 