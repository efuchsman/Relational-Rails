require "rails_helper"

RSpec.describe "Destroy" do
  describe "As a visitor" do
    describe "When I visit a dealership show page" do
      it "Has a button to delete the dealership" do
        dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
        dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)

        visit "/dealerships/#{dealership_1.id}"

        expect(page).to have_button("Delete Dealership")
      end

      it "deletes the Dealership when clicked and redirects to '/dealerships'" do
        dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
        dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)
        visit "/dealerships/#{dealership_1.id}"

        click_button "Delete Dealership"

        expect(current_path).to eq("/dealerships")
        expect(page).to_not have_content(dealership_1)

      end
    end
  end

  describe "When I visit the Dealership's index page" do
    it "Has a button  that can Delete dealerships from the Dealership Index page" do
      dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
      dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
      dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)

      visit "/dealerships"

      expect(page).to have_button("Delete #{dealership_1.dealername}")
      expect(page).to have_button("Delete #{dealership_2.dealername}")
      expect(page).to have_button("Delete #{dealership_3.dealername}")

      click_button "Delete #{dealership_1.dealername}"

      expect(current_path).to eq("/dealerships")
      expect(page).to_not have_content("Eli's Used Car Palace")
    end
  end
end
