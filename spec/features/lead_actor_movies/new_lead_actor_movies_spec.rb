# User Story 13, Parent Child Creation
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'Create child movie for lead actor', type: :feature do
  before :each do
    @will_smith = LeadActor.create!(name:'Will Smith', oscar: true, age: 53)

    @movie_1 = Movie.create!(name:'King Richard', rating:90, over_two_hours: true, lead_actor_id:@will_smith.id)
    @movie_2 = Movie.create!(name:'I Am Legend', rating:68, over_two_hours: false, lead_actor_id:@will_smith.id)
  end
  describe 'as a visitor' do
    describe 'when I visit the parent child index page, by clicking the link in the index' do
      it 'links to the new child form from the index page' do
        visit "/lead_actors/#{@will_smith.id}/movies"

        click_on("New #{@will_smith.name} Movie")

        expect(current_path).to eq("/lead_actors/#{@will_smith.id}/movies/new")
      end

      it 'and can create a new movie' do
        visit "/lead_actors/#{@will_smith.id}/movies"

        click_on("New #{@will_smith.name} Movie")

        expect(current_path).to eq("/lead_actors/#{@will_smith.id}/movies/new")

        fill_in('Name', with: 'Godzilla')
        fill_in('Rating', with: '44')
        select "true", :from => "Over two hours"
        # save_and_open_page
        click_button 'Create Movie'
        save_and_open_page
        expect(current_path).to eq("/movies")
        expect(page).to have_content("Godzilla")
      end
    end
  end
end
