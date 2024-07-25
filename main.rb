# frozen_string_literal: true

require_relative 'lib/game'

game = Game.new

loop do
  game.play
  answer = ''
  loop do
    print 'Do you wish to play again? (y/n) '
    answer = gets.chomp.downcase
    break if %w[y n].include?(answer)
  end
  break if answer == 'n'
end
