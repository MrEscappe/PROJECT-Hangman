# frozen_string_literal: true

class Hangman
  attr_accessor :words, :available_words, :name, :random

  def initialize
    @words = ['banana'] # File.read('words.txt').split
    @letters = ('a'..'z').to_a
    @available_words = []
    @random = []
    p random_word
    p @lives = @random.length + 2
    start
    @word_length = []
  end

  def start
    @player_guess = []
    @word_length = ''
    puts "Your word have #{@random.length} letters."
    puts ''
    @random.length.times do
      @word_length = @word_length += '_ '
    end
    puts @word_length.to_s
    puts 'Enter a letter:'
    player_input
  end

  def player_input
    i = false
    until i == true
      input = gets.chomp.downcase
      if /[a-z]{1}/.match?(input) && input.length == 1
        i = true
        @player_guess = input
        puts "Your guess is #{@player_guess}"
        p @player_guess.split('')
      else
        puts 'Please, input a letter'
      end
      guess
    end
  end

  def random_word
    @words.each do |i|
      i.downcase
      @available_words.push(i) if i.length >= 5 && i.length <= 12
    end
    @random = @available_words.sample
  end

  def guess
    @hint = []
    if p @random.include?(@player_guess)
      @random.split('').each do |i|
        if @player_guess[i] == @random[i]
          @hint[i] = @player_guess[i]
          p @hint
      end
    else
      @lives -= 1
      puts "Wrong! You have #{@lives} left"
    end
  end
end

game = Hangman.new
