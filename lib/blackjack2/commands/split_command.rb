class SplitCommand
  def initialize(player)
    @player = player
  end

  def execute
    @player.hands = @player.current_hand.split
    @player.take_hand!(@player.hands.first)
  end
end