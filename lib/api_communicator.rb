require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
  response_hash = JSON.parse(response_string)
  if response_hash["results"].length === 1
    puts "Character found! #{response_hash["results"][0]["name"]}"
    return response_hash["results"][0]["films"]
  else
    puts "Characters found!"
    puts "Which character would you like to see more info?"
    response_hash["results"].each do |info|
      puts info["name"]
    end
    get_character_movies_from_api(get_character_from_user)
  end
end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  films.each do |address|
    response_films_str = RestClient.get(address)
    response_films_hash = JSON.parse(response_films_str)
    puts response_films_hash["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
###########################;wdkf;lksd;flkds;kfl;dskfl;ksfkdks
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
