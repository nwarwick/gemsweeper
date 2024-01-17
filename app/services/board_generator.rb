# Inputs: height, width, number_of_gems
# Output: board layout
# Requirements:
## - height and width must be greater than 0
## - number_of_gems must be greater than 0 and less than height * width
## - Must be performant for boards of "any" dimension
class BoardGenerator
  def self.generate(height: 0, width: 0, number_of_gems: 0)
    raise ArgumentError, "board height must be greater than 0" unless height > 0
    raise ArgumentError, "board width must be greater than 0" unless width > 0
    raise ArgumentError, "number of gems must be greater than 0 and less than height * width" unless number_of_gems > 0 && number_of_gems < height * width

    # Create a 1D array with the correct number of gems and blank tiles
    tiles = Array.new(height * width - number_of_gems, Tile.new(value: 0))
    tiles += Array.new(number_of_gems, Tile.new(value: -1))

    # Shuffle the tiles and split them into a 2D array
    tiles.shuffle.each_slice(width).to_a
  end
end
