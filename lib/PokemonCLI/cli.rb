#CLI controller
class PokemonCLI::CLI  
  
  def start 
    puts "Welcome to the PokemonCLI object creator"
    list_pokemon
    menu
    good_bye
  end 
  
  def list_pokemon
    puts "1. Bulbasaur"
  end 
  
  def menu
    input = ""
    puts "Please enter a Pokemon number to see additional information about that Pokemon or type 'exit' to close the program"
    while input != 'exit'
      input = gets.downcase.strip
      case input 
      when "1"
        puts "Heres additional information about this Pokemon"
      end 
    end
  end
  
  def good_bye 
    puts "Thank you for using the PokemonCLI!"
  end 
  
end 