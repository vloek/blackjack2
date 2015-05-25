require 'spec_helper'

RSpec.describe DealCommand do
  it 'should give cards to player and diller after execute' do
    player = Player.new(1000)
    diller = Diller.new
    deck  = Deck.new
    diller.command(DealCommand.new(player, diller, deck))

    expect(player.current_hand.count).to eq(2)
    expect(diller.count).to eq(2)
  end
end