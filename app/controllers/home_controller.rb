class HomeController < ApplicationController
  before_action :set_last_ten_boards, only: [:index]
  def index
  end

  private

  def set_last_ten_boards
    @last_ten_boards = Board.last_ten
  end
end
