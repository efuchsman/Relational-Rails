require 'rails_helper'

RSpec.describe "Destroy" do
  describe "As a visitor" do
    before :each do
      @dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
      @car_1 = @dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000)
      @car_2 = @dealership.cars.create!(make: "BMW", model: "440i", year: 2019, miles: 35000, available_for_lease: true, price: 23000)
      @car_3 = @dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000)
    end
    describe "When I visit a car show page" do
      it "Has a button to delete the car" do
        visit "/cars/#{@car_2.id}"

        expect(page).to have_button("Delete")
      end

      it "deletes the Dealership when clicked and redirects to '/dealerships'" do
        visit "/cars/#{@car_2.id}"

        click_button "Delete"

        expect(current_path).to eq("/cars")
        expect("/cars").to_not have_content(@car_2)
      end

      it "Can delete vehicles from the Cars Index page" do
        visit '/cars'

        expect(page).to have_button("Delete This #{@car_1.make}")
        expect(page).to have_button("Delete This #{@car_2.make}")
        expect(page).to have_button("Delete This #{@car_3.make}")

        click_button "Delete This #{@car_2.make}"

        expect(current_path).to eq("/cars")
        expect(page).to_not have_content(@car_2)
      end
    end
  end
end
