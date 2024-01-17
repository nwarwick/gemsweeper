require "test_helper"

class BoardTest < ActiveSupport::TestCase
  def setup
    @board = Board.new(name: "Test Board", author_email: "test@example.com", layout: [])
    @gem_tile = Tile.new(value: -1)
    @empty_tile = Tile.new(value: 0)
  end

  test "should be valid" do
    assert @board.valid?
  end

  test "name should be present" do
    @board.name = ""
    assert_not @board.valid?
  end

  test "name should not be too long" do
    @board.name = "a" * 65
    assert_not @board.valid?
  end

  test "author_email should be present" do
    @board.author_email = ""
    assert_not @board.valid?
  end

  test "author_email should not be too long" do
    @board.author_email = "a" * 245 + "@example.com"
    assert_not @board.valid?
  end

  test "author_email should be a valid email" do
    @board.author_email = "invalid_email"
    assert_not @board.valid?
  end

  test "layout should have a default value" do
    board = Board.new
    assert_equal [], board.layout
  end

  test "layout should be a 2D array of objects" do
    @board.layout = [
      [@gem_tile],
      [@empty_tile]
    ]
    assert @board.valid?

    @board.layout = [[@gem_tile]]
    assert @board.valid?

    @board.layout = "not an array"
    assert_not @board.valid?

    @board.layout = [["not a tile"]]
    assert_not @board.valid?

    @board.layout = [[{"value" => 9, "revealed" => false, "flagged" => false}]]
    assert_not @board.valid?
  end
end
