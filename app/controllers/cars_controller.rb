class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

   def new
   end

   def create
   end
end
