class Diller
  extend Forwardable
  attr_reader :hand, :balance

  MAX_NUM = 17

  def_delegators :@hand, :take_card!, :take_card_from_deck!, :count, :cards, :value

  def initialize
    @balance = 0
    @hand = Hand.new
  end

  def command(command)
    command.execute
  end

  def take_hand!(hand)
    @hand = hand
  end

  def add_money!(money)
    @balance += money
  end

  def first_card
    cards.first
  end

  def flush!
    @hand = Hand.new
  end

  def take_to_self_from!(deck)
    take_card_from_deck!(deck) while(value < MAX_NUM && deck.count != 0)
  end
end

