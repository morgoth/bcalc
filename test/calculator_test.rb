require "test_helper"

class CalculatorTest < Minitest::Test
  def test_all_tricks_for_all_players
    # http://slzbs.pl/protokoly//01/chorzow/17/17ch0130024.html
    deal = "N:K87.Q2.KQ865.A95 AQ9653.T9.97.QJ4 J.K8543.JT42.T62 T42.AJ76.A3.K873"
    results = {
      "N" => {"NT" => 2, "S" => 3, "H" => 6, "D" => 8, "C" =>2},
      "E" => {"NT" => 8, "S" => 10, "H" => 7, "D" => 5, "C" => 10},
      "S" => {"NT" => 2, "S" => 2, "H" => 6, "D" => 8, "C" => 2},
      "W" => {"NT" => 8, "S" => 10, "H" => 7, "D" => 5, "C" => 10}
    }
    results.each do |declarer, suits|
      suits.each do |suit, tricks|
        message = "#{declarer} plays #{suit}"
        assert_equal tricks, Bcalc::Calculator.new(deal: deal, declarer: declarer, suit: suit).tricks, message
      end
    end
  end

  def test_tricks_for_partial_game
    # http://slzbs.pl/protokoly//01/chorzow/17/17ch0130018.html
    deal = "N:A96.JT.653.AQT94 Q73.764.QJT.KJ62 J84.A32.AK942.87 KT52.KQ985.87.53"
    calculator = Bcalc::Calculator.new(
      deal: deal,
      declarer: "W",
      suit: "H"
    )
    assert_equal 8, calculator.tricks
  end

  def test_tricks_for_small_slam
    # http://slzbs.pl/protokoly//01/chorzow/17/17ch0130019.html
    deal = "N:AKT43.AKQ7.T.K95 .J98.AQJ76.QJT82 Q9762.3.K854.A74 J85.T6542.932.63"
    calculator = Bcalc::Calculator.new(
      deal: deal,
      declarer: "N",
      suit: "S"
    )
    assert_equal 12, calculator.tricks
  end

  def test_raises_on_wrong_declarer
    deal = "N:K87.Q2.KQ865.A95 AQ9653.T9.97.QJ4 J.K8543.JT42.T62 T42.AJ76.A3.K873"
    assert_raises(ArgumentError) do
      Bcalc::Calculator.new(deal: deal, declarer: "U", suit: "S")
    end
  end

  def test_raises_on_wrong_suit
    deal = "N:K87.Q2.KQ865.A95 AQ9653.T9.97.QJ4 J.K8543.JT42.T62 T42.AJ76.A3.K873"
    assert_raises(ArgumentError) do
      Bcalc::Calculator.new(deal: deal, declarer: "N", suit: "K")
    end
  end

  def test_raises_on_invalid_deal
    assert_raises(StandardError) do
      Bcalc::Calculator.new(deal: "wrong", declarer: "N", suit: "S").tricks
    end
  end
end
