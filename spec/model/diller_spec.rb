require 'spec_helper'

RSpec.describe Diller do
  it 'should respond command method' do
    expect(Diller.new).to respond_to(:command)
  end

  it 'should take hand' do
    diller = Diller.new
    hand = Hand.new([Card.new(suit: :clubs, rank: "10")])
    diller.take_hand!(hand)
    expect(diller.hand).to eq(hand)
  end

  it 'should empty hand after flush' do
    diller = Diller.new
    hand = Hand.new([Card.new(suit: :clubs, rank: "10")])
    diller.take_hand!(hand)
    diller.flush!
    expect(diller.hand.count).to eq(0)
  end
end