# [ ] done

# User Story 12, Parent Update

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe "Dealership Update" do
  describe "As a visitor" do
    describe "When I visit a dealership show page" do
      it "Then I see a link to update the dealership 'Update Dealership'" do
      dealership = Dealership.create!(city: "Denver", dealername: "Eli's Used Car Palace", number_of_stars_rating: 3, lease_program: true)
        visit "/dealerships/#{dealership.id}"
        save_and_open_page
        expect(page).to have_content("Edit Dealership")
      end
    end
  end
end
