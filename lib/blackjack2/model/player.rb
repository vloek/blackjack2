require 'observer'

class Player
  attr_reader :balance, :current_hand, :hands, :bet
  attr_writer :hands

  extend Forwardable

  def_delegators :@current_hand, :count, :take_card_from_deck!

  def initialize(money)
    @balance = money
    @hands = []
    @bet = nil
  end

  def take_hand!(hand)
    @current_hand = hand 
  end

  def flush!
    @hands = []
    @current_hand = Hand.new
  end

  def bet!(bet)
    if @balance >= bet 
      @balance -= bet
      @bet = bet
    else
      raise "Not enough money."
    end
  end

  def reset_bet!
    @bet = nil
  end

  def add_money!(m)
    @balance += m
  end

  def double!(bet)
    bet!(bet * 2)
  end
end