# frozen_string_literal: true

class Hangman
  attr_accessor :words, :available_words, :name, :random

  def initialize
    @words = File.read('words.txt').split
    @available_words = []
    random_word
    player
    render_display
  end

  def player
    puts 'Hello! What do you like to be called?'
    @name = gets.chomp
    puts ''
    puts "Hello #{@name}, Let's play Hangman!"
  end

  def random_word
    @words.each do |i|
      i.downcase
      @available_words.push(i) if i.length >= 5 && i.length <= 12
    end
    p @random = @available_words.sample
  end

  def player_guess
    @player_input = []
    i = false
    puts "What's your guess?"
    until i == true
      input = gets.chomp.downcase
      if /[a-zA-Z]/.match?(input)
        i = true
        @player_input = input.split('')
        return @player_input
      end
    end
  end

  def render_display
    render_five = Array.new(5, '_')
    if @random.length == 5
      puts '--------'
      puts '|      |'
      puts '|       '
      puts "|#{render_five[0]} #{render_five[1]} #{render_five[2]} #{render_five[3]} #{render_five[4]} "
    end

  end
end

game = Hangman.new
