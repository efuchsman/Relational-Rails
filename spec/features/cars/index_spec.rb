require "rails_helper"

RSpec.describe "Cars Index Page", type: :feature do
  before :each do
    @dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
    @car_1 = @dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, dealer_id: 1, price: 37000)
    @car_2 = @dealership.cars.create!(make: "BMW", model: "440i", year: 2019, miles: 35000, available_for_lease: true, dealer_id: 1, price: 23000)
    @car_3 = @dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, dealer_id: 1, price: 28000)
  end

  describe "As a visitor" do
    describe "When I visit '/cars'" do
      it "Then I see each car in the system including the car's attributes" do
        visit "/cars"
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

      it 'has a link to /cars' do
        visit "/cars"
        click_on "Cars Index"

        expect(current_path).to eq("/cars")
      end

      it 'has a link to /dealerships' do
        visit "/cars"
        click_on "Dealerships Index"

        expect(current_path).to eq("/dealerships")
      end
    end

    it "only shows cas in the index with where the Available For Lease is 'true'" do
      car_4 = Car.create!(make: "Toyota", model: "Hilux", year: 1998, miles: 350000, available_for_lease: false, dealer_id: 1, price: 8500, dealership: @dealership)

      visit "/cars"

      expect(page).to_not have_content("Hilux")
    end
  end
end
