require 'observer'

class Player
  include Observable

  attr_reader :money

  def initialize(money)
    @money = money
  end

  def take_hand(hand)
    @current_hand = hand 
  end

  def hit!
    notify_observers(:hit, @current_hand)
  end

  def stand!
    notify_observers(:stand, @current_hand)
  end

  def split!
    notify_observers(:split, @current_hand)
    @current_hand = nil
  end

  def bet!(bet)
    if @money >= bet
      @money -= bet
      @bet = bet 
      @bet
    else
      raise "Not enough money."
    end
  end

  def double(bet)
    bet!(bet * 2)
  end
end