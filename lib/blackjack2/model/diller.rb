class Diller
  def initialize(players, dashboard)
    @players = players
    @players.each { |n| n.add_observer(self) }
  end

  def update(move, options)
    case move
    when :hit
      take_card_to(options[:hand])
    when :stand
      check_winner(options[:hand])
    when :split
      :ok
    end
  end
end