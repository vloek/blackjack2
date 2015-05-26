require 'spec_helper'

RSpec.describe SplitCommand do
  it 'should split player hand' do
    player = Player.new(1000)
    deck   = Deck.new
    player.take_hand!(Hand.new([Card.new(suit: :diamonds, rank: "10"), Card.new(suit: :clubs, rank: "10")]))
    SplitCommand.new(player, deck).execute
    expect(player.hands.count).to eq(1)
  end
end