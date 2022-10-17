require "rails_helper"

RSpec.describe "Dealerships Index Page", type: :feature do
  describe "As a visitor" do
    describe "When I visit '/dealerships'" do
      before :each do
        @dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        @dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
        @dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)

        visit "/dealerships"
      end

      it "Then I see the name of each dealership in the system" do


        expect(page).to have_content(@dealership_1.dealername)
        expect(page).to have_content(@dealership_2.dealername)
        expect(page).to have_content(@dealership_3.dealername)
      end

      it "I see that records are ordered by most recently created" do

        expect("Becky's Autorama").to appear_before("Shirley's Premier Used Cars")
        expect("Shirley's Premier Used Cars").to appear_before("Eli's Used Car Palace")
      end

       it "displays when the dealerships were created" do

        expect(page).to have_content(@dealership_1.created_at)
        expect(page).to have_content(@dealership_2.created_at)
        expect(page).to have_content(@dealership_3.created_at)
       end

       it 'has a link to /cars' do
        click_on "Cars Index"

        expect(current_path).to eq("/cars")
      end

      it 'has a link to /cars' do
        click_on "Dealerships Index"

        expect(current_path).to eq("/dealerships")
      end

      it 'has a link to the dealership show page' do
        click_on @dealership_1.dealername

        expect(current_path).to eq("/dealerships/#{@dealership_1.id}")
      end
    end

    it 'can update dealerships from the Dealership Index' do
      dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
      dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
      dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)

      visit "/dealerships"

      expect(page).to have_link("Edit #{dealership_1.dealername}")
      expect(page).to have_link("Edit #{dealership_2.dealername}")
      expect(page).to have_link("Edit #{dealership_3.dealername}")
    end
  end
end
