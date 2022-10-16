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
        # save_and_open_page
        expect(page).to have_content("Edit Dealership")
      end

      describe "When I click on the 'Update Dealership'" do
        it "Then I am taken to '/dealerships/:id/edit' where I see a form to edit the dealership's attributes" do
          dealership = Dealership.create!(city: "Denvar", dealername: "ELi's UsEd CAr PalACe", number_of_stars_rating: 3, lease_program: true)
          visit "/dealerships/#{dealership.id}"
          # save_and_open_page
          expect(page).to have_content("ELi's UsEd CAr PalACe")
          expect(page).to have_content("Denvar")
          expect(page).to have_content("Edit Dealership")

          click_link "Edit Dealership"
          # save_and_open_page
          expect(current_path).to eq("/dealerships/#{dealership.id}/edit")
          expect(page).to have_content("Name")
          expect(page).to have_content("Rating(number of stars)")
          expect(page).to have_content("City")
          expect(page).to have_content("Leasing available?(true/false)")
          expect(page).to have_button("Update Dealership")
        end

        describe "When I fill out the form with updated information" do
          describe "And I click the button to submit the form" do
            it "Then the dealership info is updated" do
              dealership = Dealership.create!(city: "Denvar", dealername: "ELi's UsEd CAr PalACe", number_of_stars_rating: 3, lease_program: true)

              visit "/dealerships/#{dealership.id}"

              expect(page).to have_content("ELi's UsEd CAr PalACe")
              expect(page).to have_content("Denvar")
              expect(page).to have_content("Edit Dealership")

              click_link "Edit Dealership"

              fill_in(:dealername, with: "Eli's Used Car Palace")
              fill_in(:number_of_stars_rating, with: 3)
              fill_in(:city, with: "Denver")
              fill_in(:lease_program, with: true)
              click_button('Update Dealership')

              expect(current_path).to eq("/dealerships/#{dealership.id}")
              expect(page).to have_content("Eli's Used Car Palace")
              expect(page).to have_content("Denver")

            end
          end
        end
      end
    end
  end
end
