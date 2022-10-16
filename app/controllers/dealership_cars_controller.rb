class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end

  def new
  end

  def create

  end

  private
  def dealership_cars_params

  end

end
