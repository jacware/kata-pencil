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

  def test_sharpen_pencil
    pencil = Pencil.new durability: 5
    pencil.write "thisisatest", @paper
    pencil.sharpen
    pencil.write "more", @paper
    assert_equal "thisi      more", @paper.text
  end

  def test_pencil_length_after_sharpening
    pencil = Pencil.new durability: 10, length: 2
    pencil.sharpen
    pencil.write "test", @paper
    assert_equal 6, pencil.durability
    pencil.sharpen
    assert_equal 10, pencil.durability
    pencil.write "test", @paper
    pencil.sharpen
    assert_equal 6, pencil.durability
  end

  def test_ereaser_for_wearing_out
    pencil = Pencil.new eraser_durability: 10
    paper = Paper.new "this is a test"
    pencil.erase "is ", paper
    assert_equal 8, pencil.eraser_durability
  end

  def test_eraser_stops_erasing_when_worn_out
    pencil = Pencil.new eraser_durability: 3
    paper = Paper.new "Buffalo Bill"
    pencil.erase "Bill", paper
    assert_equal "Buffalo B   ", paper.text
  end

  def test_that_a_pencil_can_edit
    @pencil.write "test     test", @paper
    @pencil.edit "abc", 5, @paper
    assert_equal "test abc test", @paper.text
  end

  def test_that_editing_reduces_durability
    @pencil.write "     ", @paper
    @pencil.edit "test", 0, @paper
    assert_equal 96, @pencil.durability
  end
end
