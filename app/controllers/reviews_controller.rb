class ReviewsController < ApplicationController
  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
