class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def new
  end

  def create

  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def destroy
  end
end
