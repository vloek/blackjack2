class SplitCommand
  def initialize(player, deck)
    @player = player
    @deck   = deck
  end

  def execute
    @player.hands = @player.current_hand.split
    @player.hands.each { |hand| hand.take_card_from_deck!(@deck) }
    @player.take_hand!(@player.hands.pop) if @player.hands.count == 2
  end
end