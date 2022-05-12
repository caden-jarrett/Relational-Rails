require "rails_helper"

RSpec.describe 'the movie lead actor page' do
  it 'displays the movie name' do
    lead_actor = Actor.create(actor_name: "Daniel Radcliffe", oscar?: false, age: 12)
    movie = Movie.create(name: "Harry Potter: The Sorcerors Stone", rating: 88, over_two_hours: true, actor_id: 1)
    visit "/movies/#{movie.id}"
  end

  it 'displays the name of the lead actor'
end
