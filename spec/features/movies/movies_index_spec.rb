require "rails_helper"

RSpec.describe 'the movies index page', type: :feature do
  it 'displays the movies name and if they have a Oscar' do

    lead_actor_1 = LeadActor.create!(name: "Daniel Radcliffe",
                                    oscar: false,
                                    age: 32)

    movie_1 = Movie.create!(name:'Guns Akimbo',
                            rating:51,
                            over_two_hours: false,
                            lead_actor_id:lead_actor_1.id)
    movie_2 = Movie.create!(name:'Guns Akimbo 2',
                            rating:51,
                            over_two_hours: false,
                            lead_actor_id:lead_actor_1.id)

    visit "/movies"

    expect(page).to have_content("Movies Index")
    expect(page).to have_content(movie_1.name)
    expect(page).to have_content(movie_2.name)
  end
end
