class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = current_user.boats.new(boat_params)
    @boat.save

    if @boat.save
      redirect_to boats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :port, :capacity, :category, :price_per_day, :license, :description, :image, photos: [])
  end
end
