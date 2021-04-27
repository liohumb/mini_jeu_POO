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

my_game = Game.new(user_name)

while my_game.is_still_ongoing? == true do
  my_game.show_players
  my_game.menu
  puts "Choisi une option"
  action = gets.chomp.to_s
  puts ""
  my_game.menu_choice(action)
  my_game.enemies_attack
end

my_game.end
