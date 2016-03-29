Dir[File.expand_path 'lib/**/*.rb'].each { |f| require_relative(f) }

require 'spec_helper'
require 'pry'

RSpec.describe Game do
  before(:all) do
    @player1 = Player.new('Tessa')
    @player2 = Player.new('Terry')
  end

  describe 'Non-tie' do
    context 'when royal flush vs anything else' do
      before do
        cards1 = to_cards('TD JD QD KD AD')
        cards2 = to_cards('TS JD QD KD AD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end

  describe 'High card vs high card' do
    context 'the highest cards in both are not equal' do
      before do
        cards1 = to_cards('3D 5C 2D TC KH')
        cards2 = to_cards('3C 5D 2C TH QD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end

      context 'highest in each is equal but 2nd highest card is different' do
        before do
          cards1 = to_cards('3D 5C 2D JC KH')
          cards2 = to_cards('3C 5D 2C TH KD')
          hand1 = Hand.new(@player1, cards1)
          hand2 = Hand.new(@player2, cards2)
          @result = Game.winner(hand1, hand2)
        end

        it 'gets the right winner' do
          expect(@result).to eq(@player1)
        end
      end
    end
  end

  describe 'pair vs pair' do
    context 'the pair with a higher value wins' do
      before do
        cards1 = to_cards('3D 5C 2D KC KH')
        cards2 = to_cards('3C 5D 2C TH TD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
    context 'both pairs have the same value, goes down to high card' do
      before do
        cards1 = to_cards('3D 5C TD KC KH')
        cards2 = to_cards('3C 5D 2C KS KD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end
  describe 'three vs three' do
    context 'the pair with a higher value wins' do
      before do
        cards1 = to_cards('3D 5C KD KC KH')
        cards2 = to_cards('3C 5D TC TH TD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
    # two 3 of a kinds with the same value is impossible unless someone cheats
  end

  describe '2pair vs 2pair' do
    context 'the pair with a higher value wins' do
      before do
        cards1 = to_cards('3D 2C 2D KC KH')
        cards2 = to_cards('3C 5D 5C TH TD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
    context 'all four pairs have the same value, goes down to high card' do
      before do
        cards1 = to_cards('5D 9C 9D KC KH')
        cards2 = to_cards('3C 9S 9H KH KD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end
  describe 'Full house vs full house' do
    context 'the fh with a higher value wins' do
      before do
        cards1 = to_cards('8D 8C KD KC KH')
        cards2 = to_cards('5C 5D TC TH TD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end
  describe 'Straight vs straight' do
    context 'the straight with a higher value wins' do
      before do
        cards1 = to_cards('6C 7D 8C 9H TD')
        cards2 = to_cards('4D 5C 6D 7C 8H')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end
  describe 'Straight flush vs straight flush' do
    context 'the straight flush with a higher value wins' do
      before do
        cards1 = to_cards('6D 7D 8D 9D TD')
        cards2 = to_cards('4C 5C 6C 7C 8C')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end
  describe 'flush vs flush' do
    context 'the flush with a higher value wins' do
      before do
        cards1 = to_cards('3D 7D 8D 9D TD')
        cards2 = to_cards('2C 5C 6C 7C 8C')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end
  describe '4 of a kind vs 4 of a kind' do
    context 'the one with a higher value wins' do
      before do
        cards1 = to_cards('2C KS KH KC KD')
        cards2 = to_cards('3D TS TH TC TD')
        hand1 = Hand.new(@player1, cards1)
        hand2 = Hand.new(@player2, cards2)
        @result = Game.winner(hand1, hand2)
      end

      it 'gets the right winner' do
        expect(@result).to eq(@player1)
      end
    end
  end
end
