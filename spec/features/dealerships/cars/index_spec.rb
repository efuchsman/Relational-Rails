require 'rails_helper'

RSpec.describe "Dealership Cars Index", type: :feature do
  describe "As a visitor" do
    describe "When I visit '/dealerships/:id/cars" do
      before :each do
        @dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        @car_1 = @dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000)
        @car_2 = @dealership.cars.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, price: 19500)
        @car_3 = @dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000)
        visit "/dealerships/#{@dealership.id}/cars"
      end

      it "Then I see each car that is associated with the dealership with each car's attributes" do

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

      it "has a link back to the dealership's show page" do
        click_on "Back to Dealership" do

          expect(current_path).to eq("/dealerships/#{@dealership.id}/cars")
        end
      end
    end
  end

  it 'sorts inventory by make alphabetically' do
    dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
    car_1 = dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000)
    car_2 = dealership.cars.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, price: 19500)
    car_3 = dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000)

    visit "/dealerships/#{dealership.id}/cars"

    expect("Mercedes-Benz").to appear_before("BMW")
    expect("BMW").to appear_before('Audi')

    expect(page).to have_button("Sort By Make")

    click_button "Sort By Make"

    expect("Audi").to appear_before("BMW")
    expect("BMW").to appear_before("Mercedes-Benz")
  end

  describe "Display Records Over a Given Threshold " do
    before :each do
      @dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
      @car_1 = @dealership.cars.create!(make: "Mercedes-Benz", model: "C300", year: 2019, miles: 24000, available_for_lease: true, price: 28000)
      @car_2 = @dealership.cars.create!(make: "BMW", model: "440i", year: 2017, miles: 51000, available_for_lease: false, price: 19500)
      @car_3 = @dealership.cars.create!(make: "Audi", model: "A4", year: 2020, miles: 16000, available_for_lease: true, price: 37000)
    end

    it 'has button that allows the user to input a number value' do
      visit "/dealerships/#{@dealership.id}/cars"

      expect(page).to have_content("Display cars over a given mile threshold")
      expect(page).to have_button("Show")
    end

    it "Displays cars with more miles than the given threshold" do
      visit "/dealerships/#{@dealership.id}/cars"
      fill_in(:miles_threshold, with: 20000)

      click_button "Show"

      expect(page).to_not have_content(@car_3)
    end
  end
end
