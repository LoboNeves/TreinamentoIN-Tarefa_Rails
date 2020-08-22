class ClassesController < ApplicationController
  before_action :set_class, only: [:show, :update, :destroy]

  # GET /classes
  def index
    @classes = Class.all

    render json: @classes
  end

  # GET /classes/1
  def show
    render json: @class
  end

  # POST /classes
  def create
    @class = Class.new(class_params)

    if @class.save
      render json: @class, status: :created, location: @class
    else
      render json: @class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classes/1
  def update
    if @class.update(class_params)
      render json: @class
    else
      render json: @class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classes/1
  def destroy
    @class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class
      @class = Class.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def class_params
      params.require(:class).permit(:initials, :day_of_the_week, :time, :status)
    end
end
