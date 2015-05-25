class Hand
  attr_reader :cards
  attr_writer :bet

  def initialize(cards=[])
    @cards = cards
  end

  def value
    @cards.inject(0) { |sum, card| sum += card.value }
  end

  def take_card_from_deck!(deck)
    take_card!(deck.next_card!)
  end

  def take_card!(card)
    self << card
    card
  end
end
