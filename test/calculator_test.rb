require "test_helper"

class CalculatorTest < Minitest::Test
  def test_calculates_tricks_number_for_north_declarer_in_nt
    calculator = Bcalc::Calculator.new(
      deal: "N:.63.AKQ987.A9732 A8654.KQ5.T.QJT6 J973.J98742.3.K4 KQT2.AT.J6542.85",
      declarer: "N",
      suit: "NT"
    )
    assert_equal 5, calculator.calculate
  end

  # fails currently
  def test_calculates_all_tricks_for_all_players
    # http://slzbs.pl/protokoly//01/chorzow/17/17ch0130024.html
    deal = "N:K87.Q2.KQ865.A95 AQ9653.T9.97.QJ4 J.K8543.JT42.T62 T42.AJ76.A3.K873"
    calculator = Bcalc::Calculator.new(
      deal: deal,
      declarer: "N",
      suit: "NT"
    )
    assert_equal 2, calculator.calculate
  end

  # fails currently
  def test_calculates_all_tricks_for_all_players_for_different_deal
    # http://slzbs.pl/protokoly//01/chorzow/17/17ch0130018.html
    deal = "N:A96.JT.653.AQT94 Q73.764.QJT.KJ62 J84.A32.AK942.87 KT52.KQ985.87.53"
    calculator = Bcalc::Calculator.new(
      deal: deal,
      declarer: "E",
      suit: "S"
    )
    assert_equal 7, calculator.calculate
  end

  def test_calculates_small_slam
    # http://www.slzbs.slaskdatacenter.pl/protokoly/01/liga/2016/3liga/3liga_16_a1t1-2.htm
    deal = "N:KT76.QT8.Q74.AQJ J8543.743.863.74 .AKJ62.AJ9.KT653 AQ92.95.KT52.982"
    calculator = Bcalc::Calculator.new(
      deal: deal,
      declarer: "N",
      suit: "H"
    )
    assert_equal 12, calculator.calculate
  end
end
