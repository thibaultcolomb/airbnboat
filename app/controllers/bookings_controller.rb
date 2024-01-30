class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @boat = Boat.find(params[:boat_id])
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
      redirect_to boats_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to boat_bookings_path(@booking)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to boat_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :boat_id, :id, :current_user_id)
  end
end
