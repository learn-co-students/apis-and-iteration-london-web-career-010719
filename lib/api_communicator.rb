require 'rest-client'
require 'json'
require 'pry'

def get_character_data(character_name)
  #make the web request
  response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
  JSON.parse(response_string.body)
end

def get_character_movies_from_api(character_hash)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  return character_hash["results"][0]["films"]
end



def get_film_info_for_film(film_links)
    # collect those film API urls, make a web request to each URL to get the info
    #  for that film
  all_films = []
  film_links.each do |link|
  response_string = RestClient.get link
  all_films << JSON.parse(response_string)
  end
  all_films
end
# return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # get_film_info_for_film(film_links) this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(movies_info_hash)
  # some iteration magic and puts out the movies in a nice list
   movies_info_hash.each do |movie|
    movie.each do |attributes, info|

      case attributes
       when "title"
         puts "-------------------------------"
         puts "Title: #{info}"
       when "episode_id"
         puts "Episode: #{info}"
       when "director"
         puts "Directed By: #{info}"
       when "producer"
         puts "Produced By: #{info}"
       when "release_date"
         puts "Released: #{info}"
       else
       end
     end
    end
  end

# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   print_movies(films)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
