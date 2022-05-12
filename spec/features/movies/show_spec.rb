require "rails_helper"

RSpec.describe 'the movie index page', type: :feature do
  it 'displays the movies name' do
    # binding.pry
    lead_actor = LeadActor.create!(name: "Daniel Radcliffe", oscar: false, age: 12)
    movie = Movie.create!(name: "Harry Potter: The Sorcerors Stone", rating: 88, over_two_hours: true, lead_actor_id: lead_actor.id)
    visit "/movies/#{movie.id}"
    # binding.pry
    expect(page).to have_content(movie.name)
  end
end
