class PokemonCLI::CLI  

  def start 
    puts "Welcome to the PokemonCLI!"
    PokemonCLI::Scraper.create_all
    list_pokemon
    menu
    good_bye
  end
  
  def list_pokemon 
    input = ""
    puts "Enter '1' to view Pokemon numbers 1 to 250"
    puts "Enter '2' to view Pokemon numbers 251 to 500"
    puts "Enter '3' to view Pokemon numbers 501 to #{PokemonCLI::Pokemon.all_pokemon.count} or type 'exit' to close the program"
    input = gets.downcase.strip 
      if input == "1" 
        list_pokemon_group(0)
      elsif input == "2" 
        list_pokemon_group(250)
      elsif input == "3" 
        list_pokemon_group(500)
      elsif input == "exit"
        good_bye
        exit
      else 
        puts "I did not understand that input."
        list_pokemon
    end
  end 
  
  def list_pokemon_group(first)
    last = first + 249 
    if PokemonCLI::Pokemon.all_pokemon[last+1..-1].count < 250
      last = -1
    end
    all_pokemon = PokemonCLI::Pokemon.all_pokemon[first..last]
    all_pokemon.each do |pokemon|
      puts "#{pokemon.number}. #{pokemon.name}"
    end
  end 
  
  def menu
    input = ""
    @all_pokemon = PokemonCLI::Pokemon.all_pokemon
    while input != 'exit'
      puts "Please enter a Pokemon number to see additional information about that Pokemon or type 'menu' to view the Home Menu or type 'exit' to close the program."
      input = gets.downcase.strip
    
      if input.to_i > 0 && input.to_i <= PokemonCLI::Pokemon.all_pokemon.count
        pokemon = @all_pokemon[input.to_i - 1] 
        PokemonCLI::Scraper.get_attributes(pokemon) if pokemon.info == nil
        puts pokemon.info
        puts "Name: #{pokemon.name}"
        puts "Number: #{pokemon.number}"
        puts "Type: #{pokemon.type}"
        puts "Species: #{pokemon.species}" 
        puts "Height: #{pokemon.height}"
        puts "Weight: #{pokemon.weight}"
        puts "-----------------------"
      elsif input == "menu"
        list_pokemon
      elsif input == 'exit' 
      else
        puts "I did not understand that input."
      end 
    end
  end
  
  def good_bye 
    puts "Thank you for using the PokemonCLI!"
  end 
  
end 