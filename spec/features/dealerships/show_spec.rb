require "rails_helper"

RSpec.describe "Dealership Show Page", type: :feature do
  before :each do
    @dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
    @dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
    @dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)
  end
  describe "As a visitor" do
    describe "When I visit '/dealerships/:id'" do
      it "Then I see the dealership with that id including the dealership's attributes" do

        visit "dealerships/#{@dealership_1.id}"
        expect(page).to have_content(@dealership_1.dealername)
        expect(page).to have_content(@dealership_1.number_of_stars_rating)
        expect(page).to have_content(@dealership_1.city)
        expect(page).to have_content(@dealership_1.lease_program)

        expect(@dealership_1.dealername).to eq("Eli's Used Car Palace")
        expect(@dealership_1.number_of_stars_rating).to eq(3)
        expect(@dealership_1.city).to eq("Denver")
        expect(@dealership_1.lease_program).to be true

        visit "dealerships/#{@dealership_2.id}"
        expect(page).to have_content(@dealership_2.dealername)
        expect(page).to have_content(@dealership_2.number_of_stars_rating)
        expect(page).to have_content(@dealership_2.city)
        expect(page).to have_content(@dealership_2.lease_program)

        expect(@dealership_2.dealername).to eq("Shirley's Premier Used Cars")
        expect(@dealership_2.number_of_stars_rating).to eq(5)
        expect(@dealership_2.city).to eq("Aurora")
        expect(@dealership_2.lease_program).to be true

        visit "dealerships/#{@dealership_3.id}"
        expect(page).to have_content(@dealership_3.dealername)
        expect(page).to have_content(@dealership_3.number_of_stars_rating)
        expect(page).to have_content(@dealership_3.city)
        expect(page).to have_content(@dealership_3.lease_program)

        expect(@dealership_3.dealername).to eq("Becky's Autorama")
        expect(@dealership_3.number_of_stars_rating).to eq(5)
        expect(@dealership_3.city).to eq("Boulder")
        expect(@dealership_3.lease_program).to be true
      end

      it "shows the total number of vehicles in inventory" do
        @car_1 = @dealership_1.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000)
        @car_2 = @dealership_1.cars.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, price: 19500)
        @car_3 = @dealership_1.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000)

        visit "dealerships/#{@dealership_1.id}"
        expect(page).to have_content("Total Number of Vehicles in Inventory")
        expect(@dealership_1.counting_cars).to eq(3)

        visit "dealerships/#{@dealership_2.id}"
        expect(page).to have_content("Total Number of Vehicles in Inventory")
        expect(@dealership_2.counting_cars).to eq(0)
      end

      it 'has a link to /dealerships' do
        visit "/dealerships/#{@dealership_1.id}"
        click_on "Dealerships Index"
        expect(current_path).to eq("/dealerships")
      end

      it "has a link to the dealership's inventory" do
        visit "/dealerships/#{@dealership_1.id}"
        click_on "Dealership Inventory"
        expect(current_path).to eq("/dealerships/#{@dealership_1.id}/cars")
      end
    end
  end
end
