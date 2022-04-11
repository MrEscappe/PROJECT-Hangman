# frozen_string_literal: true

class Hangman
  attr_accessor :words, :available_words, :name, :random

  def initialize
    @words = File.read('words.txt').split
    @random = []
    random_word
    @lives = @random.length + 2
    start
    @word_length = ''
  end

  def start
    @word_length = ''
    puts "Your word have #{@random.length} letters."
    puts ''
    render
    player_input
  end

  def render
    @board = '_' * @random.size
    puts @board
  end

  def render_game(last_guess)
    i = 0
    while i < @random.size
      @board[i] = @random[i] if last_guess == @random[i]
      i += 1
    end
  end

  def update_render
    puts @board
    if @board == @random
      puts 'YOU WON!!!'
      exit
    end
  end

  def player_input
    i = false
    puts ''
    puts 'If you want to save just write (save) and if you want to load the game just write (load).'
    puts 'To play just input a letter:'
    input = gets.chomp.downcase
    until i == true
      case input
      when 'save'
        save_method
      when 'load'
        load_method
      end
      if /[a-z]{1}/.match?(input) && input.length == 1
        i = true
        @player_guess = input
      else
        puts 'Please, input a letter'
        player_input
      end
    end
    guess
  end

  def random_word
    @words.each do |i|
      i.downcase
      @available_words.push(i) if i.length >= 5 && i.length <= 12
    end
    @random = @available_words.sample
  end

  def guess
    if @lives > 1
      if @random.include?(@player_guess)
        puts ''
        puts 'Right letter!'
      else
        @lives -= 1
        puts "Wrong letter! You have #{@lives} lives left."

      end

      render_game(@player_guess)
      update_render
      player_input
    else
      puts 'Too bad! You are out of lives!'
      puts "The secret word is #{random}!"
      puts 'GAME OVER!'
    end
  end

  def save_method

  end

  def load_method

  end


end

game = Hangman.new
