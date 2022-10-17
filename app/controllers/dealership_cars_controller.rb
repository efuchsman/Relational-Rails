class DealershipCarsController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    if params[:sort_by_make] == "true"
      @cars = @dealership.cars.order(:make)
    end

    if params[:miles_threshold] != nil
      miles = params[:miles_threshold]
      @cars = @cars.miles_threshold(miles)
    end
  end

  def new
    @dealership = Dealership.find(params[:id])
  end

  def create
    dealership = Dealership.find(params[:id])
    car = dealership.cars.create!(dealership_cars_params)
    redirect_to "/dealerships/#{dealership.id}/cars"
  end

  private
  def dealership_cars_params
  params.permit(:make, :model, :year, :miles, :available_for_lease, :dealer_id, :price)
  end
end
