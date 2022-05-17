require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do
  it 'displays the lead actors name and their information' do

    lead_actor = LeadActor.create!(name: "Daniel Radcliffe", oscar: false,
                              age: 12,)
    lead_actor.movies.create!(name: "Harry Potter: The Sorcerors Stone",
                              rating: 88,
                              over_two_hours: true,
                              lead_actor_id: lead_actor.id)

    visit "/lead_actors/#{lead_actor.id}"

    expect(page).to have_content("#{lead_actor.name} Movie's")
    expect(page).to have_content("Count of #{lead_actor.name} Movie's: #{lead_actor.movies.count}")
    expect(page).to have_content("Has Received a Oscar: #{lead_actor.oscar}")
    expect(page).to have_content("Current age: #{lead_actor.age}")
    expect(page).to have_content("Lead Actor ID: #{lead_actor.id}")
  end
end
