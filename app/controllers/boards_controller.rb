class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  # GET /boards
  def index
    @pagy, @boards = pagy(Board.all)
  end

  # GET /boards/1
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  def create
    name = board_params[:name]
    author_email = board_params[:author_email]
    height = board_params[:height].to_i
    width = board_params[:width].to_i
    number_of_gems = board_params[:number_of_gems].to_i
    @board = Board.new(name: name, author_email: author_email)

    begin
      @board.layout = BoardGenerator.generate(
        height: height,
        width: width,
        number_of_gems: number_of_gems
      )
    rescue ArgumentError => e
      @board.errors.add(:base, e.message)
    end

    if @board.errors.empty? && @board.save
      redirect_to @board, notice: "Board was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      redirect_to @board, notice: "Board was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy!
    redirect_to boards_url, notice: "Board was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def board_params
    params.require(:board).permit(:name, :author_email, :layout, :height, :width, :number_of_gems)
  end
end
