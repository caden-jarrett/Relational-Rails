require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do

  before :each do
    @lead_actor_1 = LeadActor.create!(name: "Daniel Radcliffe",
                                      oscar: false,
                                      age: 32,
                                      created_at: 3.seconds.ago)
    @movie_1 = Movie.create!(name:'Guns Akimbo',
                            rating:51,
                            over_two_hours: false,
                            lead_actor_id:@lead_actor_1.id)
    @movie_2 = Movie.create!(name:'Guns Akimbo 2',
                            rating:51,
                            over_two_hours: false,
                            lead_actor_id:@lead_actor_1.id)
  end

  it "displays the ammount of movies each lead actor has in the db" do

    visit "/lead_actors/#{@lead_actor_1.id}"

    expect(page).to have_content("#{@lead_actor_1.name} Movie's")
    expect(page).to have_content("Count of #{@lead_actor_1.name} Movie's: #{@lead_actor_1.movies.count}")
    expect(page).to have_content("Has Received a Oscar: #{@lead_actor_1.oscar}")
    expect(page).to have_content("Current age: #{@lead_actor_1.age}")
    expect(page).to have_content("Lead Actor ID: #{@lead_actor_1.id}")
  end

  describe "links" do
    it 'links to each lead actor to their show page' do

      visit "/lead_actors/#{@lead_actor_1.id}"

      click_on @lead_actor_1.name

      expect(current_path). to eq("/lead_actors/#{@lead_actor_1.id}/movies")
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
