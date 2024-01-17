class Board < ApplicationRecord
  validates :name, presence: true, length: {maximum: 64}
  validates :author_email, presence: true, length: {maximum: 254}, format: {with: URI::MailTo::EMAIL_REGEXP}
  validate :layout_is_a_2d_array_of_tiles

  before_save :generate_layout_html

  scope :last_ten, -> { order(created_at: :desc).limit(10) }

  def layout
    return super unless super.is_a?(Array)

    super.map { |row| row.map { |tile| Tile.from_h(tile) } }
  end

  private

  def generate_layout_html
    self.layout_html = layout.map { |row|
      "<div class='board__row'>" + row.map(&:html).join + "</div>"
    }.join
  end

  def layout_is_a_2d_array_of_tiles
    unless layout.is_a?(Array) && layout.all? { |row| row.is_a?(Array) && row.all? { |tile| tile.is_a?(Tile) } }
      errors.add(:layout, "must be a 2D array of Tile objects")
    end
  rescue ArgumentError => e
    errors.add(:layout, "contains an invalid tile: #{e.message}")
  end
end
