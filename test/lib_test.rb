require "test_helper"

class LibTest < Minitest::Test
  def test_returns_version
    assert_equal 14020, Bcalc::Lib.bcalc_runtimeVersion
  end

  def test_returns_tricks_number_for_n_in_nt
    solver = Bcalc::Lib.bcalcDDS_new("PBN", "N:.63.AKQ987.A9732 A8654.KQ5.T.QJT6 J973.J98742.3.K4 KQT2.AT.J6542.85", 4, 0)
    assert_equal 5, Bcalc::Lib.bcalcDDS_getTricksToTake(solver)
  end
end
