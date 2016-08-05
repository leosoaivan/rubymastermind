#!/usr/bin/env ruby

class Game
  def initialize
    start_message
  end

  private

  def start_message
    puts "Welcome to Master Mind!"
    puts "Try to guess the computer's 4-character code, from A through F."
  end
end

x = Game.new
