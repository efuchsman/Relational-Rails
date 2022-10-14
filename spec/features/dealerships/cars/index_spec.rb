# [ ] done

# User Story 5, Parent Children Index

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe "Dealership Cars Index", type: :feature do
  describe "As a visitor" do
    describe "When I visit '/dealerships/:id/cars" do
      before :each do
        @dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        @car_1 = @dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, dealer_id: 1, price: 37000)
        @car_2 = @dealership.cars.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, dealer_id: 1, price: 19500)
        @car_3 = @dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, dealer_id: 1, price: 28000)
      end
      it "Then I see each car that is associated with the dealership with each car's attributes" do
        visit "/dealerships/#{@dealership.id}/cars"
 save_and_open_page
        expect(page).to have_content(@car_1.make)
        expect(page).to have_content(@car_1.model)
        expect(page).to have_content(@car_1.year)
        expect(page).to have_content(@car_1.miles)
        expect(page).to have_content(@car_1.available_for_lease)
        expect(page).to have_content(@car_1.price)

        expect(page).to have_content(@car_2.make)
        expect(page).to have_content(@car_2.model)
        expect(page).to have_content(@car_2.year)
        expect(page).to have_content(@car_2.miles)
        expect(page).to have_content(@car_2.available_for_lease)
        expect(page).to have_content(@car_2.price)

        expect(page).to have_content(@car_3.make)
        expect(page).to have_content(@car_3.model)
        expect(page).to have_content(@car_3.year)
        expect(page).to have_content(@car_3.miles)
        expect(page).to have_content(@car_3.available_for_lease)
        expect(page).to have_content(@car_3.price)

      end
    end
  end
end
