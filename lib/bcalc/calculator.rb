module Bcalc
  class Calculator
    SUITS = {
      "C" => Bcalc::Lib::BCALC_SUIT_CLUBS,
      "D" => Bcalc::Lib::BCALC_SUIT_DIAMONDS,
      "H" => Bcalc::Lib::BCALC_SUIT_HEARTS,
      "S" => Bcalc::Lib::BCALC_SUIT_SPADES,
      "NT" => Bcalc::Lib::BCALC_NT
    }
    PLAYERS = {
      "N" => Bcalc::Lib::BCALC_PLAYER_NORTH,
      "E" => Bcalc::Lib::BCALC_PLAYER_EAST,
      "S" => Bcalc::Lib::BCALC_PLAYER_SOUTH,
      "W" => Bcalc::Lib::BCALC_PLAYER_WEST,
    }

    attr_reader :deal, :declarer, :suit

    def initialize(deal:, declarer:, suit:)
      @deal = deal
      @declarer = declarer
      @suit = suit
    end

    def calculate
      solver = Bcalc::Lib.bcalcDDS_new("PBN", deal, SUITS[suit], PLAYERS[declarer])
      result = Bcalc::Lib.bcalcDDS_getTricksToTake(solver)
      Bcalc::Lib.bcalcDDS_delete(solver)
      result
    end
  end
end
