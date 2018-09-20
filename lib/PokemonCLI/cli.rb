#CLI controller
class PokemonCLI::CLI  
  
  def start 
    puts "Welcome to the PokemonCLI!"
    list_pokemon
    menu
    good_bye
  end 
  
  def list_pokemon #use each_with_index once we are creating obj's
    @pokemon = PokemonCLI::Pokemon.all
    @pokemon.each_with_index(1) do |i, pokemon|
      puts "#{i}. #{pokemon}"
    end
  end 
  
  def menu
    input = ""
    while input != 'exit'
    
      puts "Please enter a Pokemon number to see additional information about that Pokemon or type 'list' to view the list of Pokemon or type 'exit' to close the program."
      
      input = gets.downcase.strip
      
      if input.to_i > 0 
        puts @pokemon[input.to_i-1].name
        puts "Num: #{@pokemon[input.to_i-1].number}"
        puts "Type: #{@pokemon[input.to_i-1].type}"
        puts "Species:#{@pokemon[input.to_i-1].species}" #etc...
        
      elsif input == "list"
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