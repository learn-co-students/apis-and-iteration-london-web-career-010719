#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"


def run
welcome
character = get_character_from_user
character_info = get_character_data(character)

movies_list = get_character_movies_from_api(character_info)
movies_info_hash = get_film_info_for_film(movies_list)
print_movies(movies_info_hash)
end

run
