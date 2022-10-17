class CarsController < ApplicationController
  def index
    @cars = Car.all.where(available_for_lease: true)
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    redirect_to "/cars/#{car.id}"
  end

   def show
    @car = Car.find(params[:id])
   end

   def destroy
    car = Car.find(params[:id])
    car.destroy
    redirect_to "/cars"
   end

   private
   def car_params
    params.permit(:make, :model, :year, :miles, :available_for_lease, :dealer_id, :price)
    end
end
