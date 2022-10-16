require 'rails_helper'

RSpec.describe 'Dealership Creation' do
  describe "As a visitor" do
    describe "When I visit the Dealership Index page" do
      it "Then I see a link to create a new Dealership record, 'New Dealership'" do
        visit "/dealerships"

        expect(page).to have_content("New Dealership")
      end

      describe "I click this link" do
        it "Then I am taken to '/dealerships/new' where I see a form for a new dealership record" do
          visit '/dealerships'

          click_link("New Dealership")
          expect(current_path).to eq('/dealerships/new')
        end
      end

      describe "When I fill out the form with a new dealership's attributes:" do
        describe "And I click the button 'Create Dealership' to submit the form" do
          it " Then a `POST` request is sent the '/dealerships' route and I am redirected to the Parent Index page where I see the new Parent displayed." do
            visit '/dealerships/new'

            fill_in(:dealername, with: "EchoPark")
            fill_in(:city, with: "Thorton")
            fill_in(:lease_program, with: true)
            click_button('Create Dealership')

            expect(current_path).to eq("/dealerships")
            expect(page).to have_content("EchoPark")
          end
        end
      end
    end
  end
end
