# [ ] done

# User Story 4, Child Show

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

require "rails_helper"

RSpec.describe "Car Show Page", type: :feature do
  describe "As a visitor" do
    describe "When I visit '/cars/:id'" do
      it "Then I see the child with that id including the child's attributes" do
        car_1 = Car.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, dealer_id: 1, price: 37000)
        car_2 = Car.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, dealer_id: 1, price: 19500)
        car_3 = Car.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, dealer_id: 1, price: 28000)

        visit "cars/#{car_1.id}"
        # save_and_open_page
        expect(page).to have_content(car_1.make)
        expect(page).to have_content(car_1.model)
        expect(page).to have_content(car_1.year)
        expect(page).to have_content(car_1.miles)
        expect(page).to have_content(car_1.available_for_lease)
        expect(page).to have_content(car_1.dealer_id)
        expect(page).to have_content(car_1.price)

        expect(car_1.make).to eq("Audi")
        expect(car_1.model).to eq("A4")
        expect(car_1.year).to eq(2020)
        expect(car_1.miles).to eq(16000)
        expect(car_1.available_for_lease).to be true
        expect(car_1.dealer_id).to eq(1)
        expect(car_1.price).to eq(37000)

        visit "cars/#{car_2.id}"
        expect(page).to have_content(car_2.make)
        expect(page).to have_content(car_2.model)
        expect(page).to have_content(car_2.year)
        expect(page).to have_content(car_2.miles)
        expect(page).to have_content(car_2.available_for_lease)
        expect(page).to have_content(car_2.dealer_id)
        expect(page).to have_content(car_2.price)

        visit "cars/#{car_3.id}"
        expect(page).to have_content(car_3.make)
        expect(page).to have_content(car_3.model)
        expect(page).to have_content(car_3.year)
        expect(page).to have_content(car_3.miles)
        expect(page).to have_content(car_3.available_for_lease)
        expect(page).to have_content(car_3.dealer_id)
        expect(page).to have_content(car_3.price)

        expect(car_3.make).to eq("Mercedes-Benz")
        expect(car_3.model).to eq("C300")
        expect(car_3.year).to eq(2019)
        expect(car_3.miles).to eq(24000)
        expect(car_3.available_for_lease).to be true
        expect(car_3.dealer_id).to eq(1)
        expect(car_3.price).to eq(28000)

      end
    end
  end
end
