class BoatsController < ApplicationController

  def index
    @boats = Boat.all
    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
        # info_window_html: render_to_string(partial: "info_window", locals: {boat: boat})

        # marker_html: render_to_string(partial: "marker")
      }
    end
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

    if @boat.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to dashboard_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :port, :capacity, :category, :price_per_day, :license, :description, photos: [])
  end
end
