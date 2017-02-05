require "test_helper"

class LibTest < Minitest::Test
  def test_returns_version
    assert_equal 14020, Bcalc::Lib.bcalc_runtimeVersion
  end

  def test_returns_tricks_number_for_north_player_in_nt
    solver = Bcalc::Lib.bcalcDDS_new(
      "PBN",
      "N:.63.AKQ987.A9732 A8654.KQ5.T.QJT6 J973.J98742.3.K4 KQT2.AT.J6542.85",
      Bcalc::Lib::BCALC_NT,
      Bcalc::Lib::BCALC_PLAYER_NORTH
    )
    assert_equal 5, Bcalc::Lib.bcalcDDS_getTricksToTake(solver)
  end

  def test_deletes_solver
    solver = Bcalc::Lib.bcalcDDS_new(
      "PBN",
      "N:.63.AKQ987.A9732 A8654.KQ5.T.QJT6 J973.J98742.3.K4 KQT2.AT.J6542.85",
      Bcalc::Lib::BCALC_NT,
      Bcalc::Lib::BCALC_PLAYER_NORTH
    )
    assert_nil Bcalc::Lib.bcalcDDS_delete(solver)
  end

  def test_last_non_nil_error
    solver = Bcalc::Lib.bcalcDDS_new(
      "PBN",
      "wrong",
      Bcalc::Lib::BCALC_NT,
      Bcalc::Lib::BCALC_PLAYER_NORTH
    )
    assert_equal "Error: not received expected expression \":\"", Bcalc::Lib.bcalcDDS_getLastError(solver)
  end

  def test_last_nil_error
    solver = Bcalc::Lib.bcalcDDS_new(
      "PBN",
      "N:.63.AKQ987.A9732 A8654.KQ5.T.QJT6 J973.J98742.3.K4 KQT2.AT.J6542.85",
      Bcalc::Lib::BCALC_NT,
      Bcalc::Lib::BCALC_PLAYER_NORTH
    )
    assert_nil Bcalc::Lib.bcalcDDS_getLastError(solver)
  end
end
