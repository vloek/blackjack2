class Card
  attr_reader :rank, :score, :suit

  def initialize(options)
    @rank  = options[:rank]
    @suit  = options[:suit]
    @score = score_by_rank(options[:rank])
  end

  def value
    @score.to_i
  end

  def to_i
    value
  end

  def to_s
    "#{@suit.to_s.capitalize}_#{@rank}"
  end

  def score_by_rank(rank)
    return 10 if ['J', 'Q', 'K'].include?(rank)
    return 11 if rank == 'A'
    @rank
  end

end
