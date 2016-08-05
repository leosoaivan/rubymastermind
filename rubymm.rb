#!/usr/bin/env ruby

class Game
  attr_accessor :code, :charset

  def initialize
    @charset = ("A".."F").to_a
    @code = []
    start_message
  end

  private

  def start_message
    puts "Welcome to Master Mind!"
    puts "Try to guess the computer's 4-character code, using the letters A through F."
    puts "Duplicates letters ARE allowed!"
    puts ""
  end

  def code_generator
  	4.times do
  	  @code << @charset[rand(6)]
  	end
  end

  def player_guess
  	begin
  	  puts "Enter your 4-letter code:"
  	  guess = gets.gsub!(/\s+/, "").upcase
  	end until guess.size == 4 && /[A-F]+{4}/.match(guess)
  	guess
  end
end

x = Game.new
