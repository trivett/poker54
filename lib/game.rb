# This module has the rules of poker in it.
module Game
  module_function

  def winner(hand1, hand2)
    return tiebreak(hand1, hand2) if hand1 == hand2
    return hand1.player if hand1 > hand2
    hand2.player
  end

  def tiebreak(hand1, hand2)
    if [15, 17, 31].include?(hand1.rank)
      return compare_values_of_dupes(1, hand1, hand2).player
    elsif [16, 20].include?(hand1.rank)
      return compare_values_of_dupes(2, hand1, hand2).player
    else
      return compare_high_cards(hand1, hand2).player
    end
  end

  def compare_values_of_dupes(num, hand1, hand2)
    pair_values_1 = hand1.count_each_value.keys.last(num)
    pair_values_2 = hand2.count_each_value.keys.last(num)

    (num - 1).downto(0) do |n|
      unless pair_values_1[n] == pair_values_2[n]
        result = pair_values_1[n] > pair_values_2[n] ? hand1 : hand2
      end
      return result ||= compare_high_cards(hand1, hand2)
    end
  end

  def compare_high_cards(hand1, hand2)
    4.downto(0) do |n|
      unless (hand1.cards[n] <=> hand2.cards[n]) == 0
        return hand1.cards[n] > hand2.cards[n] ? hand1 : hand2
      end
    end
  end
end
