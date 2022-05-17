# User Story 11, Parent Creation
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'New Lead Actor', type: :feature do
  describe 'as a visitor' do
    describe 'when i visit the new artist for, by clicking a link on the index' do
      it 'links to the new page from the lead actors index' do
        visit '/lead_actors'

        click_on('New Lead Actor')

        expect(current_path).to eq('/lead_actors/new')
      end

      it 'and can create a new artist' do
        visit '/lead_actors/new'

        fill_in('Name', with: 'Tom Hardy')
        select "false", :from => "Oscar"
        fill_in('Age', with: '44')
        # save_and_open_page
        click_button 'Create Lead Actor'

        expect(current_path).to eq("/lead_actors")
        expect(page).to have_content("Tom Hardy")
      end
    end
  end
end
