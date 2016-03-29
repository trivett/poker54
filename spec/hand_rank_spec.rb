Dir[File.expand_path 'lib/**/*.rb'].each { |f| require_relative(f) }

require 'spec_helper'
RSpec.describe Hand do
  before(:all) do
    @player1 = Player.new('Tim')
  end
  describe 'Royal Flush' do
    context 'when royal flush' do
      before do
        cards = to_cards('TD JD QD KD AD')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 23
      end
    end
  end

  describe 'Straight Flush' do
    context 'when straight flush' do
      before do
        cards = to_cards('9D TD JD QD KD')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 22
      end
    end
  end

  describe 'Four of a kind' do
    context 'when four of a kind' do
      before do
        cards = to_cards('TD TS TC TH AD')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 21
      end
    end
  end

  describe 'Full House' do
    context 'when full house' do
      before do
        cards = to_cards('3D 3C TD TC TH')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 20
      end
    end
  end

  describe 'flush' do
    context 'when non-royal flush' do
      before do
        cards = to_cards('3D 4D TD 1D KD')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 19
      end
    end
  end
  describe 'Straight' do
    context 'when straight' do
      before do
        cards = to_cards('3D 4C 5D 6C 7H')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 18
      end
    end
  end
  describe 'Three of a kind' do
    context 'when three of a kind' do
      before do
        cards = to_cards('3D 3C 3H 4C TH')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 17
      end
    end
  end
  describe 'Two pair' do
    context 'when two pair' do
      before do
        cards = to_cards('3D 3C TD TC KH')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 16
      end
    end
  end
  describe 'One pair' do
    context 'when one pair' do
      before do
        cards = to_cards('3D 3C TD AC KH')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 15
      end
    end
  end
  describe 'High Card' do
    context 'when high card' do
      before do
        cards = to_cards('3D 5C 2D TC KH')
        @hand = Hand.new(@player1, cards)
      end

      it 'gets the right rank' do
        expect(@hand.rank).to eq 13
      end
    end
  end
end
