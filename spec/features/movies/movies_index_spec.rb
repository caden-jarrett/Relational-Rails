require "rails_helper"

RSpec.describe 'the movies index page', type: :feature do
  before :each do
    @lead_actor_1 = LeadActor.create!(name: "Daniel Radcliffe",
                                    oscar: false,
                                    age: 32)

    @movie_1 = Movie.create!(name:'Guns Akimbo',
                            rating:51,
                            over_two_hours: false,
                            lead_actor_id:@lead_actor_1.id)
    @movie_2 = Movie.create!(name:'Guns Akimbo 2',
                            rating:51,
                            over_two_hours: false,
                            lead_actor_id:@lead_actor_1.id)

  end
  it 'displays the movies name and if they have a Oscar' do

    visit "/movies"

    expect(page).to have_content("Movies Index")
    expect(page).to have_content(@movie_1.name)
    expect(page).to have_content(@movie_2.name)
  end

  describe "links" do
    it 'links to each movies show page' do
      visit "/movies"

      click_on @movie_1.name

      expect(current_path). to eq("/movies/#{@movie_1.id}")
    end

    it "to movie index page" do
      visit "/lead_actors"

      click_on "Lead Actors Index"

      expect(current_path). to eq("/lead_actors")
    end

    it "a child index link at the top of the page" do
      visit "/lead_actors"

      click_on "Movie Index"

      expect(current_path). to eq("/movies")
    end
  end
end
