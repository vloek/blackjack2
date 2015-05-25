require 'spec_helper'

RSpec.describe StandCommand do
  it 'should add money to balance player if win' do
    player = Player.new(1000)
    diller = Diller.new
    deck   = Deck.new

    player.bet!(200)
    balance = player.balance

    player.take_hand!(
        Hand.new([Card.new(suit: :diamonds, rank: "10"), Card.new(suit: :clubs, rank: "A")]))
    diller.take_hand!(
        Hand.new([Card.new(suit: :diamonds, rank: "10"), Card.new(suit: :clubs, rank: "7")]))

    # FIX THIS

    StandCommand.new(player, diller, deck).execute
    expect(player.balance).to eq(1200)
  end

  it 'should change balance player' do
    player = Player.new(1000)
    diller = Diller.new
    deck   = Deck.new
    balance = player.balance

    player.bet!(200)

    player.take_hand!(
        Hand.new([Card.new(suit: :diamonds, rank: "10"), Card.new(suit: :clubs, rank: "K")]))
    diller.take_hand!(
        Hand.new([Card.new(suit: :diamonds, rank: "10"), Card.new(suit: :clubs, rank: "K")]))

    # FIX THIS

    StandCommand.new(player, diller, deck).execute
    expect(player.balance).to eq(1000)
  end

  it 'should change balance player' do
    player = Player.new(1000)
    diller = Diller.new
    deck   = Deck.new

    player.bet!(200)
    balance = player.balance

    player.take_hand!(
        Hand.new([Card.new(suit: :diamonds, rank: "10"), Card.new(suit: :clubs, rank: "7")]))
    diller.take_hand!(
        Hand.new([Card.new(suit: :diamonds, rank: "10"), Card.new(suit: :clubs, rank: "A")]))

    # FIX THIS

    StandCommand.new(player, diller, deck).execute
    expect(player.balance).to eq(800)
  end

end