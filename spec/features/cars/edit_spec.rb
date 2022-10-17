require 'rails_helper'

RSpec.describe "Car Update" do
  describe "As a visitor" do
    describe "When I visit a Car Show page" do
      it "Then I see a link to update that car 'Update Vehicle'" do
        dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        car_1 = Car.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000, dealership: dealership)

        visit "/cars/#{car_1.id}"
        expect(page).to have_link("Edit Vehicle")
      end
      describe "When I click the link" do
        it "I am taken '/cars/id/edit'" do
          dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
          car_1 = Car.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000, dealership: dealership)
          visit "/cars/#{car_1.id}"

          click_link "Edit Vehicle"

          expect(current_path).to eq("/cars/#{car_1.id}/edit")
          expect(page).to have_content("Make")
          expect(page).to have_content("Model")
          expect(page).to have_content("Year")
          expect(page).to have_content("Miles")
          expect(page).to have_content("Available for lease?(true/false)")
          expect(page).to have_content("Price")
          expect(page).to have_button("Update Vehicle")
        end
      end

      describe "When I fill out the form and click 'Update Vehicle'" do
        it "the vehicle attributes are updated and I am redirected to the cars index" do
          dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
          car_1 = Car.create!(make: "Subaroo", model: "WRX", year: 2030, miles: 16000, available_for_lease: true, price: 7000, dealership: dealership)
          visit "/cars/#{car_1.id}"

          expect(page).to have_content("Subaroo")
          expect(page).to have_content("WRX")
          expect(page).to have_content(2030)
          expect(page).to have_content(7000)

          click_link "Edit Vehicle"

          expect(current_path).to eq("/cars/#{car_1.id}/edit")

          fill_in(:make, with: "Subaru")
          fill_in(:model, with: "WRX")
          fill_in(:year, with: 2020)
          fill_in(:miles, with: 22000)
          fill_in(:available_for_lease, with: true)
          fill_in(:price, with: 26000)

          click_button "Update Vehicle"

          expect(current_path).to eq("/cars/#{car_1.id}")
          expect(page).to_not have_content("Subaroo")

          click_link "Cars Index"

          expect(current_path).to eq("/cars")
          expect(page).to_not have_content("Subaroo")
        end
      end
    end
  end
end
