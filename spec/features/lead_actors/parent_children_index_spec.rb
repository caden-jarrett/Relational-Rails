require "rails_helper"

RSpec.describe 'the lead actors movies index page', type: :feature do
  it 'displays the  lead actors movie names and ratings' do
    Movie.destroy_all
    LeadActor.destroy_all
    lead_actor = LeadActor.create!(name: "Daniel Radcliffe", oscar: false, age: 12, id:1)
    movie = Movie.create!(name: "Harry Potter: The Sorcerors Stone", rating: 88, over_two_hours: true, lead_actor_id: lead_actor.id)

    binding.pry
    visit "/lead_actors/#{lead_actor.id}/movies"
    expect(page).to have_content("#{lead_actor.name} Movies")
    expect(page).to have_content(movie.name)
    expect(page).to have_content("Rating out of 100(Rotten Tomatoes): #{movie.rating}")
  end
end
