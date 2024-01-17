standard_board = BoardGenerator.generate(height: 10, width: 10, number_of_gems: 3)
large_board = BoardGenerator.generate(height: 100, width: 100, number_of_gems: 20)
rectangular_board = BoardGenerator.generate(height: 20, width: 10, number_of_gems: 4)

Board.create!(name: "Standard Board", author_email: "joe.standard@test.com", layout: standard_board)
Board.create!(name: "Large Board", author_email: "joe.large@test.com", layout: large_board)
Board.create!(name: "Rectangular Board", author_email: "joe.rectangle@test.com", layout: rectangular_board)

20.times do
  Board.create!(name: "Duplicate Board", author_email: "joe.duplicate@test.com", layout: standard_board, created_at: 1.days.ago)
end
