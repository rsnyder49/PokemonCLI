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
    puts "Enter '3' to view Pokemon numbers 501 to 809 or type 'exit' to close the program"
    input = gets.downcase.strip 
      if input == "1" 
        list_pokemon_1_to_250 
      elsif input == "2" 
        list_pokemon_251_to_500
      elsif input == "3" 
        list_pokemon_501_to_807
      elsif input == "exit"
        good_bye
        exit
      else 
        puts "I did not understand that input."
        list_pokemon
    end
  end 
  
  def list_pokemon_1_to_250
    all_pokemon = PokemonCLI::Pokemon.all_pokemon[1..250]
    all_pokemon.each do |pokemon|
      puts "#{pokemon.number}. #{pokemon.name}"
    end
  end 
  
  def list_pokemon_251_to_500 
    all_pokemon = PokemonCLI::Pokemon.all_pokemon[251..500]
    all_pokemon.each do |pokemon|
      puts "#{pokemon.number}. #{pokemon.name}"
    end 
  end 
  
  def list_pokemon_501_to_807
    all_pokemon = PokemonCLI::Pokemon.all_pokemon[501..-1]
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
      if input.to_i > 0 && input.to_i <= 809
        pokemon = @all_pokemon[input.to_i] 
        pokemon = PokemonCLI::Scraper.get_attributes(pokemon.name)
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