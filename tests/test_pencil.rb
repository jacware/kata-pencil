require "minitest/autorun"
require_relative "../config.rb"

class TestPencil < Minitest::Test
  def setup
    @paper = Paper.new
    @pencil = Pencil.new durability: 100
  end
  def test_writing_on_paper
    pencil = Pencil.new
    pencil.write "test", @paper
    assert_equal "test", @paper.text
    pencil.write " 2", @paper
    assert_equal "test 2", @paper.text
  end

  def test_pencil_durability
    @pencil.write "test", @paper
    assert_equal 96, @pencil.durability
  end

  def test_pencil_durability_whitespace
    @pencil.write "1 2\n3", @paper
    assert_equal 97, @pencil.durability
  end

  def test_pencil_durability_case
    @pencil.write "AAbb", @paper
    assert_equal 94, @pencil.durability
  end

  def test_pencil_durability_run_out
    pencil = Pencil.new durability: 4
    pencil.write "Text", @paper
    assert_equal 0, pencil.durability
    assert_equal "Tex ", @paper.text
    pencil = Pencil.new durability: 4
    @paper.reset
    pencil.write "thisisatest", @paper
    assert_equal "this       ", @paper.text
  end
end
