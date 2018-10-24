class PokemonCLI::Scraper 
  
  def self.get_all_page
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/all"))
  end 
  
  def self.create_all
    get_all_page.css("tr").each do |a|
    name = a.css("td a.ent-name").text
      if PokemonCLI::Pokemon.all_pokemon.find {|o| o.name == name } == nil
        pokemon = PokemonCLI::Pokemon.new
        pokemon.number = a.css("span.infocard-cell-data").text
        pokemon.name = name
      end
    end
  end

  def self.get_attributes(pokemon_name)
    doc = Nokogiri::HTML(open("https://pokemondb.net/pokedex/#{pokemon_name}")) 
    pokemon = PokemonCLI::Pokemon.new
    pokemon.name = doc.search('h1').first.text
    pokemon.info = doc.search('p')[0].text
    pokemon.number = doc.search('tr td')[0].text
    pokemon.species = doc.search('tr td')[2].text
    pokemon.height = doc.search('tr td')[3].text
    pokemon.weight = doc.search('tr td')[4].text 
    pokemon.type = doc.search('tr td a')[0].text
    pokemon.type += "/#{doc.search('tr td a')[1].text}" if doc.search('tr td a')[1].text == "Fire" || doc.search('tr td a')[1].text == "Poison" || doc.search('tr td a')[1].text == "Water" || doc.search('tr td a')[1].text == "Grass" || doc.search('tr td a')[1].text == "Flying" || doc.search('tr td a')[1].text == "Psychic" || doc.search('tr td a')[1].text == "Rock" || doc.search('tr td a')[1].text == "Fairy" || doc.search('tr td a')[1].text == "Steel" || doc.search('tr td a')[1].text == "Ground" || doc.search('tr td a')[1].text == "Electric" || doc.search('tr td a')[1].text == "Fighting"
    pokemon 
  end
  
end 