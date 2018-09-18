#CLI controller
class PokemonCLI::CLI  
  
  def start 
    puts "Welcome to the PokemonCLI"
    list_pokemon
    menu
    good_bye
  end 
  
  def list_pokemon
    
    @pokemon = PokemonCLI::Pokemon.all 
  end 
  
  def menu
    input = ""
    
    while input != 'exit'
      puts "Please enter a Pokemon number to see additional information about that Pokemon or type 'list' to view the list of Pokemon or type 'exit' to close the program."
      input = gets.downcase.strip
      case input 
      when "1"
        puts "Heres additional information about this Pokemon:"
      when 'list'
        list_pokemon
      else 
        puts "I did not understand that input, please type 'list' or 'exit'."
      end 
    end
  end
  
  def good_bye 
    puts "Thank you for using the PokemonCLI!"
  end 
  
end 