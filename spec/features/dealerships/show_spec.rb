# [ ] done

# User Story 2, Parent Show

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

require "rails_helper"

RSpec.describe "Dealership Show Page", type: :feature do
  describe "As a visitor" do
    describe "When I visit '/dealerships/:id'" do
      it "Then I see the dealership with that id including the dealership's attributes" do
        dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
        dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)

        visit "dealerships/#{dealership_1.id}"
        expect(page).to have_content(dealership_1.dealername)
        expect(page).to have_content(dealership_1.number_of_stars_rating)
        expect(page).to have_content(dealership_1.city)
        expect(page).to have_content(dealership_1.lease_program)

        expect(dealership_1.dealername).to eq("Eli's Used Car Palace")
        expect(dealership_1.number_of_stars_rating).to eq(3)
        expect(dealership_1.city).to eq("Denver")
        expect(dealership_1.lease_program).to be true

        visit "dealerships/#{dealership_2.id}"
        expect(page).to have_content(dealership_2.dealername)
        expect(page).to have_content(dealership_2.number_of_stars_rating)
        expect(page).to have_content(dealership_2.city)
        expect(page).to have_content(dealership_2.lease_program)

        expect(dealership_2.dealername).to eq("Shirley's Premier Used Cars")
        expect(dealership_2.number_of_stars_rating).to eq(5)
        expect(dealership_2.city).to eq("Aurora")
        expect(dealership_2.lease_program).to be true

        visit "dealerships/#{dealership_3.id}"
        expect(page).to have_content(dealership_3.dealername)
        expect(page).to have_content(dealership_3.number_of_stars_rating)
        expect(page).to have_content(dealership_3.city)
        expect(page).to have_content(dealership_3.lease_program)

        expect(dealership_3.dealername).to eq("Becky's Autorama")
        expect(dealership_3.number_of_stars_rating).to eq(5)
        expect(dealership_3.city).to eq("Boulder")
        expect(dealership_3.lease_program).to be true

      end
    end
  end
end
