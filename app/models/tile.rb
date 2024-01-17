class Tile
  # Value: -1 = gem, 0 = empty
  # Revealed: true = revealed, false = hidden (not used)
  # Flagged: true = flagged, false = not flagged (not used)
  attr_accessor :value, :revealed, :flagged

  def initialize(value: 0, revealed: false, flagged: false)
    raise ArgumentError, "value must be -1 or 0" unless [-1, 0].include?(value)
    raise ArgumentError, "revealed must be a boolean" unless [true, false].include?(revealed)
    raise ArgumentError, "flagged must be a boolean" unless [true, false].include?(flagged)

    @value = value
    @revealed = revealed
    @flagged = flagged
  end

  def to_h
    {"value" => @value, "revealed" => @revealed, "flagged" => @flagged}
  end

  def self.from_h(hash)
    new(value: hash["value"], revealed: hash["revealed"], flagged: hash["flagged"])
  end

  def gem?
    @value == -1
  end

  def empty?
    @value == 0
  end

  def html
    if gem?
      "<div class='board__tile board__tile--gem'>
        💎
      </div>"
    else
      "<div class='board__tile board__tile--empty'>
        ⬜️
      </div>"
    end
  end
end
