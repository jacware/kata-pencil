require "minitest/autorun"
require_relative "../config.rb"

class TestPaper < Minitest::Test
  def test_new_paper
    paper = Paper.new
    assert_equal "", paper.text
  end

  def test_ereasing
    paper = Paper.new "test 1 test"
    paper.erase "test"
    assert_equal "test 1     ", paper.text
    paper.erase "test"
    assert_equal "     1     ", paper.text
  end

  def test_ereasing_non_existant_string
    paper = Paper.new "test 1 test"
    paper.erase "abc"
    assert_equal "test 1 test", paper.text
  end

  def test_editing
    paper = Paper.new "An       a day keeps the doctor away"
    paper.edit "onion", 3
    assert_equal "An onion a day keeps the doctor away", paper.text
  end

  def test_editing_with_overlap
    paper = Paper.new "An       a day keeps the doctor away"
    paper.edit "artichoke", 3
    assert_equal "An artich@k@ay keeps the doctor away", paper.text
  end

  def test_editing_out_of_bounds
    paper = Paper.new "a        a"
    paper.edit "test", -1
    assert_equal "a        a", paper.text
    paper.edit "test", 100
    assert_equal "a        a", paper.text
  end

  def test_editing_string_longer_then_paper
    paper = Paper.new "a   a"
    paper.edit "testtesttest", 1
    assert_equal "ates@@@@@@@@@", paper.text
  end
end
