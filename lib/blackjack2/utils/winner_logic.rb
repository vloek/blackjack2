module Utils
  module WinnerLogic
    def check_winner(player_hand, diller_hand)
      return :diller if player_hand.value > 21
      return :player if diller_hand.value > 21
      return :player if player_hand.value == 21 && player_hand.count == 2
      if player_hand.value == diller_hand.value
        :push
      elsif diller_hand.value < player_hand.value
        :player
      else
        :diller
      end
    end
  end
end