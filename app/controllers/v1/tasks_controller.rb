class V1::TasksController < ApplicationController
  before_action :set_v1_task, only: %i[ show update destroy ]

  # GET /v1/tasks
  def index
    @v1_tasks = V1::Task.all

    render json: @v1_tasks
  end

  # GET /v1/tasks/1
  def show
    render json: @v1_task
  end

  # POST /v1/tasks
  def create
    @v1_task = V1::Task.new(v1_task_params)

    if @v1_task.save
      render json: @v1_task, status: :created, location: @v1_task
    else
      render json: @v1_task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/tasks/1
  def update
    if @v1_task.update(v1_task_params)
      render json: @v1_task
    else
      render json: @v1_task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/tasks/1
  def destroy
    @v1_task.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_task
      @v1_task = V1::Task.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def v1_task_params
      params.expect(v1_task: [ :title, :description, :status, :board_id, :user_id ])
    end
end
