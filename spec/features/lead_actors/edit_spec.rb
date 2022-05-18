# User Story 12, Parent Update
#
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
RSpec.describe 'Update Lead Actor', type: :feature do
  before :each do
    @leonardo_dicaprio = LeadActor.create!(name:'Leonardo dicapri', oscar: true, age: 47)
  end
  describe 'as a visitor' do
    describe 'when I visit the update artist form'do
      it 'links to the update page from the lead actors index' do
        visit '/lead_actors'
        # binding.pry

        click_on("Edit #{@leonardo_dicaprio.name}")

        expect(current_path).to eq("/lead_actors/#{@leonardo_dicaprio.id}/edit")
      end

      it 'can edit the lead actor' do
        visit '/lead_actors'
        # binding.pry

        click_on("Edit #{@leonardo_dicaprio.name}")

        expect(current_path).to eq("/lead_actors/#{@leonardo_dicaprio.id}/edit")
        # save_and_open_page
        fill_in 'Name', with: 'Leonardo Dicaprio'
        select "true", :from => "Oscar"
        fill_in('Age', with: '47')

        click_button "Update #{@leonardo_dicaprio.name}"

        expect(current_path).to eq("/lead_actors/#{@leonardo_dicaprio.id}")

        expect(page).to have_content('Leonardo Dicaprio')
      end
    end
  end
end
