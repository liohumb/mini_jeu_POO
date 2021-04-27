require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts ""
puts "———————————————————————————————————————————————————"
puts "•    Bienvenue sur 'ILS VEULENT TOUS MA POO' !    •"
puts "• Le but du jeu est d'être le dernier survivant ! •"
puts "———————————————————————————————————————————————————"
puts ""

puts "Choisi ton pseudo :"
print "• "
user_name = gets.chomp
puts ""
puts ""
user = HumanPlayer.new(user_name)

players_arr = [player1 = Player.new("Josiane"), player2 = Player.new("José")]
