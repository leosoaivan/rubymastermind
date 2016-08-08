#!/usr/bin/env ruby

class Game
  attr_accessor :code

  def initialize
    @charset = ("A".."F").to_a
    @code = []
    @@turns = 12

    game_start
  end

  private

  def game_start
  	code_generator
  	start_message
  	puts "#{@code}"
  	game_loop
  end

  def code_generator
  	4.times do
  	  @code << @charset[rand(6)]
  	end
  end

  def start_message
    puts "Welcome to Master Mind!"
    puts "Guess the computer's 4-character code, using the letters A thru F."
    puts "Duplicate letters ARE allowed!"
    puts ""
  end

  def game_loop
  	begin
  	  puts "You have #{@@turns} turns left."
  	  player_guess = get_guess
  	  evaluate_guess(player_guess)
  	  @@turns -= 1
  	end until @@turns == 0 || player_guess == @code
  end

  def get_guess
  	begin
  	  puts "Enter your 4-letter code, A thru F:"
  	  guess = gets.gsub!(/\s+/, "").upcase
  	end until guess.size == 4 && /[A-F]+{4}/.match(guess)
  	guess.split(//)
  end

  def evaluate_guess(player_guess)
  	if player_guess == @code
  	  puts "You won!"
  	else
      puts "#{exact_matches(player_guess)} exact, #{close_matches(player_guess)} close"
    end
  end

  def exact_matches(player_guess)
  	exact = 0
  	for i in 0..(player_guess.size - 1)
  	  next unless player_guess[i] == @code[i]
  	  exact += 1
  	end
  	exact
  end

  def close_matches(player_guess)
  	player_ary = []
  	code_ary = []
  	for i in 0..(player_guess.size - 1)
  	  next unless player_guess[i] != @code[i]
  	  player_ary << player_guess[i]
  	  code_ary << @code[i]
  	end
  	(player_ary&code_ary).length
  end

end

x = Game.new
