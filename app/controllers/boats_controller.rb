class BoatsController < ApplicationController

  def index
    if params[:query].present? && params[:start_date].present? && params[:end_date].present?
      @boats = Boat.search_by_name_port_and_category_and_description(params[:query]).where.not(id: Boat.joins(:bookings)
      .where("bookings.start_date < ? AND bookings.end_date > ?", params[:end_date], params[:start_date])
      .select(:id))
    elsif params[:query].present?
      @boats = Boat.search_by_name_port_and_category_and_description(params[:query])
    elsif params[:start_date].present? && params[:end_date].present?
      @boats = Boat.where.not(id: Boat.joins(:bookings)
                                     .where("bookings.start_date < ? AND bookings.end_date > ?", params[:end_date], params[:start_date])
                                     .select(:id))
    else
      @boats = Boat.all
    end

    @markers = @boats.geocoded.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {boat: boat}),
        marker_html: render_to_string(partial: "marker")
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
