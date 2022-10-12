class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end

  def new
  end

  def create

  end

  def show
  end

  def destroy
  end
end
