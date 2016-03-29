# RankHand only ranks hands and gets this ugly conditional out of the Hand class
module RankHand
  module_function

  def self.rank(hand)
    if hand.royal_flush?
      23
    elsif hand.straight_flush?
      22
    elsif hand.four_of_a_kind?
      21
    elsif hand.full_house?
      20
    elsif hand.same_suit?
      19
    elsif hand.consecutive_values?
      18
    elsif hand.three_of_a_kind?
      17
    elsif hand.two_pairs?
      16
    elsif hand.pair?
      15
    else
      hand.highest_value_card
    end
  end
end
