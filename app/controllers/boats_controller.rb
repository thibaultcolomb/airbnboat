class BoatsController < ApplicationController

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    @booking = Booking.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = current_user.boats.new(boat_params)
    @boat.save
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :port, :capacity, :category, :price_per_day, :description, :image)
  end
end
