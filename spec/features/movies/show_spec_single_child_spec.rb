require "rails_helper"

RSpec.describe 'the movie index page', type: :feature do
  it 'displays the  movies name and rating' do
    lead_actor = LeadActor.create!(name: "Daniel Radcliffe",
                                  oscar: false,
                                  age: 12)
    movie_1 = lead_actor.movies.create!(name: "Harry Potter: The Sorcerors Stone",
                              rating: 88,
                              over_two_hours: true,
                              lead_actor_id: lead_actor.id)
    # binding.pry
    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.name)
    expect(page).to have_content("Movie Rating(Rotten Tomatoes): #{movie_1.rating}")
    expect(page).to have_content("Over Two Hours?: #{movie_1.over_two_hours}")
    expect(page).to have_content("Lead Actor's ID: #{movie_1.lead_actor_id}")
  end
end
