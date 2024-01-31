class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @boats = Boat.last(3)
  end

  
end
