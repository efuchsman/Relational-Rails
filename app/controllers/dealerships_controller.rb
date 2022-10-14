class DealershipsController < ApplicationController
  def index
    @dealerships = most_recently_created_first(Dealership.all)
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

  def most_recently_created_first(dealerships)
    dealerships.order(:created_at).reverse
  end
end
