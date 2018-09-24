class PokemonCLI::CLI  
  
  def start 
    puts "Welcome to the PokemonCLI!"
    list_pokemon
    menu
    good_bye
  end 
  
  def list_pokemon 
    @all_pokemon = PokemonCLI::Pokemon.create_all.all
    @all_pokemon.each_with_index(1) do |i, pokemon|
      puts "#{i}. #{pokemon.name}"
    end
  end 
  
  def menu
    input = ""
    while input != 'exit'
    
      puts "Please enter a Pokemon number to see additional information about that Pokemon or type 'list' to view the list of Pokemon or type 'exit' to close the program."
      
      input = gets.downcase.strip
      
      if input.to_i > 0 
        pokemon = @all_pokemon[input.to_i-1].get_attributes(pokemon.name)
        puts pokemon[input.to_i-1].name
        puts "Num: #{pokemon[input.to_i-1].number}"
        puts "Type: #{pokemon[input.to_i-1].type}"
        puts "Species:#{pokemon[input.to_i-1].species}" #etc...
        
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