class StandCommand
  include ::Utils::WinnerLogic

  def initialize(player, diller, deck)
    @player = player
    @diller = diller
    @deck = deck
  end

  def execute
    @diller.take_to_self_from!(@deck)
    who_won = check_winner(@player.current_hand, @diller.hand)
    change_balance_winner(who_won)
    @player.take_hand!(@player.hands.pop) if @player.hands.count != 0
    who_won
  end

  def change_balance_winner(who_won)
    case who_won
    when :player
      @player.add_money!(@player.bet * 2)
      @player.reset_bet!
    when :diller
      @diller.add_money!(@player.bet)
      @player.reset_bet!
    when :push
      @player.add_money!(@player.bet)
      @player.reset_bet!
      :push
    end
  end
end


