class V1::BoardsController < ApplicationController
  before_action :set_v1_board, only: %i[ show update destroy ]

  # GET /v1/boards
  def index
    @v1_boards = V1::Board.all

    render json: @v1_boards
  end

  # GET /v1/boards/1
  def show
    render json: @v1_board
  end

  # POST /v1/boards
  def create
    @v1_board = V1::Board.new(v1_board_params)

    if @v1_board.save
      render json: @v1_board, status: :created, location: @v1_board
    else
      render json: @v1_board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/boards/1
  def update
    if @v1_board.update(v1_board_params)
      render json: @v1_board
    else
      render json: @v1_board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/boards/1
  def destroy
    @v1_board.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_board
      @v1_board = V1::Board.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def v1_board_params
      params.expect(v1_board: [ :title, :description, :user_id ])
    end
end
