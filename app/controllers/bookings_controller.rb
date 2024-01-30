class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    @booking.user = current_user

    if @booking.save
      redirect_to boat_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end