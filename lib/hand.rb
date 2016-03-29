require_relative 'rank_hand'
class Hand
  include RankHand
  include Comparable

  attr_accessor :rank, :cards, :player

  def initialize(player, cards)
    @player = player
    @cards = cards.sort_by(&:value)
    @rank = RankHand.rank(self)
  end

  def same_suit?
    suits = @cards.map(&:suit)
    suits.uniq.count == 1
  end

  def consecutive_values?
    values = @cards.map(&:value).sort!
    values == (values.first..values.last).to_a
  end

  def count_each_value
    value_counts = {}
    @cards.map do |card|
      if value_counts[card.value]
        value_counts[card.value] += 1
      else
        value_counts[card.value] = 1
      end
    end
    value_counts.sort_by { |_k, v| v }.to_h
  end

  def royal_flush?
    sum == 60 && same_suit?
  end

  def straight_flush?
    consecutive_values? && same_suit?
  end

  def full_house?
    count_each_value.values.last(2) == [2, 3]
  end

  def four_of_a_kind?
    count_each_value.values.last == 4
  end

  def three_of_a_kind?
    count_each_value.values.last == 3
  end

  def two_pairs?
    count_each_value.values.last(2) == [2, 2]
  end

  def pair?
    count_each_value.values.last == 2
  end

  def highest_value_card
    @cards.last.value
  end

  def sum
    @cards.map(&:value).inject(0, &:+)
  end

  def <=>(other)
    rank <=> other.rank
  end
end
