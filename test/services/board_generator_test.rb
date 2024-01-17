# test/services/board_generator_test.rb
require "test_helper"

class BoardGeneratorTest < ActiveSupport::TestCase
  test "raises an error if height is not greater than 0" do
    assert_raises ArgumentError do
      BoardGenerator.generate(height: 0, width: 10, number_of_gems: 20)
    end
  end

  test "raises an error if width is not greater than 0" do
    assert_raises ArgumentError do
      BoardGenerator.generate(height: 10, width: 0, number_of_gems: 20)
    end
  end

  test "raises an error if number_of_gems is not greater than 0 and less than height * width" do
    assert_raises ArgumentError do
      BoardGenerator.generate(height: 10, width: 10, number_of_gems: 200)
    end
  end
end
