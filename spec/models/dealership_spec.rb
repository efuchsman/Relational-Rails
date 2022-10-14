require 'rails_helper'

RSpec.describe Dealership, type: :model do
 it {should have_many :cars}

 describe 'instance methods' do
  before :each do
    @dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
    @car_1 = @dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, dealer_id: 1, price: 37000)
    @car_2 = @dealership.cars.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, dealer_id: 1, price: 19500)
    @car_3 = @dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, dealer_id: 1, price: 28000)
  end
  it 'counts the total number of cars in the dealership' do
    expect(@dealership.counting_cars).to eq(3)
  end
 end
end
