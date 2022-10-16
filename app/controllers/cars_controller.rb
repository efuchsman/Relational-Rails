class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def edit
  end

  def update
  end
  #  def new
  #  end

  #  def create
  #  end

   def show
    @car = Car.find(params[:id])
   end
end
