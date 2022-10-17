require "rails_helper"

RSpec.describe "Destroy" do
  describe "As a visitor" do
    describe "When I visit a dealership show page" do
      it "Has a link to delete the dealership" do
        dealership_1 = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        dealership_2 = Dealership.create!(city: "Aurora", dealername: "Shirley's Premier Used Cars", number_of_stars_rating: 5, lease_program: true)
        dealership_3 = Dealership.create!(city: "Boulder", dealername: "Becky's Autorama", number_of_stars_rating: 5, lease_program: true)

        visit "/dealerships/#{dealership_1.id}"

        expect(page).to have_link("Delete Dealership")
      end
    end
  end
end
