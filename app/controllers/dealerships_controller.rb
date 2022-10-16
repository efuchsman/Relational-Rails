class DealershipsController < ApplicationController
  def index
    @dealerships = most_recently_created_first(Dealership.all)
  end

  def new

  end

  def create
    dealership = Dealership.create!(
      dealername: params[:dealername],
      city: params[:city],
      number_of_stars_rating: params[:number_of_stars_rating],
      lease_program: params[:lease_program]
    )
    redirect_to "/dealerships"
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def destroy
  end

  def most_recently_created_first(dealerships)
    dealerships.order(:created_at).reverse
  end
end
