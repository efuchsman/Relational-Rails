# [ ] done

# User Story 1, Parent Index

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require "rails_helper"

RSpec.describe "Dealerships Index Page", type: :feature do
  before :each do
    @dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
    @dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
    @dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)
  end

  describe "As a visitor" do
    describe "When I visit '/dealerships'" do
      it "Then I see the name of each dealership in the system" do
        visit "/dealerships"
        #  save_and_open_page
        expect(page).to have_content(@dealership_1.dealername)
        expect(page).to have_content(@dealership_2.dealername)
        expect(page).to have_content(@dealership_3.dealername)

      end

      it "I see that records are ordered by most recently created" do
        visit "/dealerships"
        expect("Becky's Autorama").to appear_before("Shirley's Premier Used Cars")
        expect("Shirley's Premier Used Cars").to appear_before("Eli's Used Car Palace")
      end
       it "displays when the dealerships were created" do
        visit "/dealerships"
        expect(page).to have_content(@dealership_1.created_at)
        expect(page).to have_content(@dealership_2.created_at)
        expect(page).to have_content(@dealership_3.created_at)
       end
    end
  end
end
