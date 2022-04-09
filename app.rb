# frozen_string_literal: true

class Hangman
  attr_accessor :words, :available_words, :name, :random

  def initialize
    @words = File.read('words.txt').split
    @letters = ('a'..'z').to_a
    @available_words = []
    @random = ''
    random_word
    start
    
  end

  def start
    @player_input = []
    puts "Hi! Your word have #{@random.length} letters"
    puts "\n"
    puts 'Enter a letter:'
    i = false
    until i == true
      input = gets.chomp.downcase
      if /[a-z]{1}/.match?(input) && input.length == 1
        i = true
        @player_input = input
        return @player_input
      else
        puts 'Please, input a letter'
      end
    end
  end

  def random_word
    @words.each do |i|
      i.downcase
      @available_words.push(i) if i.length >= 5 && i.length <= 12
    end
    @random = @available_words.sample
  end

  def player_guess; end

  def def(render_display); end
end

game = Hangman.new
