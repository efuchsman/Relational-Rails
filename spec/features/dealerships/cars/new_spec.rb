require 'rails_helper'

RSpec.describe "Dealership Car Creation" do
  describe "As a visitor" do
    describe "When I visit a Dealership Inventory Index page" do
      it "Then I see a link to add a new car to the inventory for that dealership 'Add Vehicle'" do
        dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        car_1 = Car.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000, dealership: dealership)
        car_2 = Car.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, price: 19500, dealership: dealership)
        car_3 = Car.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000, dealership: dealership)

        visit "/dealerships/#{dealership.id}/cars"

        # save_and_open_page
        expect(page).to have_link("Add Vehicle")
      end

      describe "When I click the link" do
        it "I am take to '/dealerships/:id/cars/new' where I see a form to add a new vehicle" do
          dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
          car_1 = Car.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000, dealership: dealership)
          car_2 = Car.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, price: 19500, dealership: dealership)
          car_3 = Car.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000, dealership: dealership)

          expect(dealership.cars).to eq([car_1, car_2, car_3])
          visit "/dealerships/#{dealership.id}/cars"
          # save_and_open_page
          click_link "Add Vehicle"

          expect(current_path).to eq("/dealerships/#{dealership.id}/cars/new")
          expect(page).to have_content("Make")
          expect(page).to have_content("Model")
          expect(page).to have_content("Year")
          expect(page).to have_content("Miles")
          expect(page).to have_content("Available for lease?(true/false)")
          expect(page).to have_content("Price")
          expect(page).to have_button("Create Vehicle")
        end
      end

      describe "When  I fill out the form with the vehicles attributes and click 'Create Vehicle'" do
        it "A new vehicle is created and I am redirected to the dealerships inventory page" do
          dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
          car_1 = Car.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000, dealership: dealership)
          car_2 = Car.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, price: 19500, dealership: dealership)
          car_3 = Car.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000, dealership: dealership)
          visit "/dealerships/#{dealership.id}/cars/new"

          fill_in(:make, with: "Porsche")
          fill_in(:model, with: "911 Turbo")
          fill_in(:year, with: 2020)
          fill_in(:miles, with: 7500)
          fill_in(:available_for_lease, with: true)
          fill_in(:price, with: 63000)

          click_button "Create Vehicle"

          expect(current_path).to eq("/dealerships/#{dealership.id}/cars")
          expect(dealership.counting_cars).to eq(4)
        end
      end
    end
  end
end

