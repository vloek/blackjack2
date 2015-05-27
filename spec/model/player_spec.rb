require 'spec_helper'

RSpec.describe Player do
  it 'should take hand' do 
    player = Player.new(1000)
    player.take_hand!(Hand.new)
    expect(player.current_hand.class).to eq(Hand)
  end

  it 'should lose money after bet' do 
    player = Player.new(1000)
    player.bet!(200)
    expect(player.balance).to eq(800)
  end

  it 'should nil bet after reset_bet' do 
    player = Player.new(1000)
    player.bet!(200)
    player.reset_bet!
    expect(player.bet).to eq(nil)
  end

  it 'should change balance after add money' do 
    player = Player.new(1000)
    player.add_money!(100)
    expect(player.balance).to eq(1100)
  end
end