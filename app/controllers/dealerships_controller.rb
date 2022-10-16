class DealershipsController < ApplicationController
  def index
    @dealerships = most_recently_created_first(Dealership.all)
  end

  def new
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def create
    dealership = Dealership.create!(dealership_params)
    redirect_to "/dealerships"
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def update
    dealership = Dealership.find(params[:id])
    dealership.update(dealership_params)
    redirect_to "/dealerships/#{dealership.id}"
  end

  def destroy
  end

  def most_recently_created_first(dealerships)
    dealerships.order(:created_at).reverse
  end

  private
  def dealership_params
    params.permit(:dealername, :city, :number_of_stars_rating, :lease_program)
  end
end
