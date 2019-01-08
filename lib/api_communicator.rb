require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_hash = pull_from_api("http://www.swapi.co/api/people/")
  get_film_urls(response_hash, character_name).collect do |film_url|
    pull_from_api(film_url)
  end
end

def pull_from_api(url)
  JSON.parse(RestClient.get(url))
end

def get_film_urls(hash, character_name)
  film_array=[]
  hash["results"].each {|character_data|
  if character_data["name"].downcase! == character_name
    film_array = character_data["films"]
  end }
  film_array
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
  films.each do |film|
    puts film["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
