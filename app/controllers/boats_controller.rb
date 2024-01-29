# app/controllers/boats_controller.rb
class BoatsController < ApplicationController
  before_action :set_boat, only: [:new, :create]

  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to new_boat_path(@boat), notice: 'Boat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :port, :capacity, :type, :price_per_day, :license, :description, :image)
  end
end
