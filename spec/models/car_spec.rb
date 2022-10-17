require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "Belong" do
    it {should belong_to :dealership}
  end

  describe "#miles_threshold" do
    it "return cars over the given threshold" do
      dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
      car_1 = Car.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, dealer_id: 1, price: 37000, dealership: dealership)
      car_2 = Car.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, dealer_id: 1, price: 19500, dealership: dealership)
      car_3 = Car.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, dealer_id: 1, price: 28000, dealership: dealership)

      expect(dealership.cars.miles_threshold(20000)).to eq([car_2, car_3])
    end
  end
end
