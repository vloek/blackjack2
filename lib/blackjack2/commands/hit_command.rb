class HitCommand
  def initialize(hand, deck)
    @hand = hand
    @deck = deck
  end

  def execute
    @hand.take_card_from_deck!(@deck)
  end
end