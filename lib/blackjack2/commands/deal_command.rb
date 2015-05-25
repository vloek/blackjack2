class DealCommand

  def initialize(player, diller, deck)
    @player = player
    @diller = diller
    @deck   = deck
  end

  def execute
    @player.flush!
    @diller.flush!

    if @deck.count >= 4
      2.times do
        @player.take_card_from_deck!(@deck)
        @diller.take_card_from_deck!(@deck)
      end
    else
      raise "Not enough cards in deck"
    end
  end

end