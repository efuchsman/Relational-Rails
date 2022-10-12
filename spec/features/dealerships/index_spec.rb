# [ ] done

# User Story 1, Parent Index

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require "rails_helper"

RSpec.describe "Dealerships Index Page" do
  describe "As a visitor" do
    describe "When I visit '/dealerships'" do
      it "Then I see the name of each dealership in the system" do
        dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
        visit "/dealerships"
        # save_and_open_page
        expect(page).to have_content(dealership_1.dealername)
        expect(page).to have_content(dealership_2.dealername)
      end
    end
  end
end
