require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do
  before :each do

        @lead_actor = LeadActor.create!(name: "Daniel Radcliffe", oscar: false,
                                  age: 12,)
        @movie = Movie.create!(name: "Harry Potter: The Sorcerors Stone",
                                  rating: 88,
                                  over_two_hours: true,
                                  lead_actor_id: @lead_actor.id)
  end
  it 'displays the lead actors name and their information' do

    visit "/lead_actors/#{@lead_actor.id}"

    expect(page).to have_content("#{@lead_actor.name} Movie's")
    expect(page).to have_content("Count of #{@lead_actor.name} Movie's: #{@lead_actor.movies.count}")
    expect(page).to have_content("Has Received a Oscar: #{@lead_actor.oscar}")
    expect(page).to have_content("Current age: #{@lead_actor.age}")
    expect(page).to have_content("Lead Actor ID: #{@lead_actor.id}")
  end
  
  describe "links" do
    it 'links to each lead actor to their show page' do

      visit "/lead_actors/#{@lead_actor.id}"

      click_on @lead_actor.name

      expect(current_path). to eq("/lead_actors/#{@lead_actor.id}/movies")
    end

    it "has a parent index link at the top of the page" do
      visit "/lead_actors"

      click_on "Lead Actors Index"

      expect(current_path). to eq("/lead_actors")
    end

    it "has a child index link at the top of the page" do
      visit "/lead_actors"

      click_on "Movie Index"

      expect(current_path). to eq("/movies")
    end
  end
end
