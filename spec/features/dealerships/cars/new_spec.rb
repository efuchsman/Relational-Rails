# [ ] done

# User Story 13, Parent Child Creation

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe "Dealership Car Creation" do
  describe "As a visitor" do
    describe "When I visit a Dealership Inventory Index page" do
      it "Then I see a link to add a new car to the inventory for that dealership 'Add Vehicle'" do
        dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        car_1 = dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, dealer_id: 1, price: 37000)
        car_2 = dealership.cars.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, dealer_id: 1, price: 19500)
        car_3 = dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, dealer_id: 1, price: 28000)

        visit "/dealerships/#{dealership.id}/cars"

        # save_and_open_page
        expect(page).to have_link("Add Vehicle")
      end
    end
  end
end

