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
end
