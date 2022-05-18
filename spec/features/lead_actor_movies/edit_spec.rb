# [ ] done
#
# User Story 14, Child Update
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'Edit lead actor movies', type: :feature do
  before :each do
    @will_smith = LeadActor.create!(name:'Will Smith', oscar: true, age: 53)

    @movie_1 = Movie.create!(name:'King Richard', rating:90, over_two_hours: true, lead_actor_id:@will_smith.id)
    @movie_2 = Movie.create!(name:'I Am Legend', rating:68, over_two_hours: false, lead_actor_id:@will_smith.id)
  end

  describe 'as a visitor' do
    describe 'when I visit the lead actor movies index' do
      it 'can link me to a edit form for a lead actors move' do
        visit "/movies/#{@movie_1.id}"
        # binding.pry
        click_on("Edit #{@movie_1.name}")

        expect(current_path).to eq("/movies/#{@movie_1.id}/edit")
      end

      it 'can edit the lead actor' do
        visit "/movies/#{@movie_1.id}"
        # binding.pry

        click_on("Edit #{@movie_1.name}")

        expect(current_path).to eq("/movies/#{@movie_1.id}/edit")

        fill_in 'Name', with: 'Godzilla'
        fill_in('Rating', with: '47')
        select "true", :from => "Over two hours"
        # save_and_open_page
        click_button "Update #{@movie_1.name}"

        expect(current_path).to eq("/movies/#{@movie_1.id}")

        expect(page).to have_content('Godzilla')
      end
    end
  end
end
