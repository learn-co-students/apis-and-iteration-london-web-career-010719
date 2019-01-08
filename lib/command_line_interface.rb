require 'require_relative'
require_relative "api_communicator.rb"



def welcome
  puts "Welcome to the StarWars App!"
end

def get_character_from_user
  puts "please enter a character name"
  input = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
end

def run
  input = get_character_from_user
  show_character_movies(input)
end

run
