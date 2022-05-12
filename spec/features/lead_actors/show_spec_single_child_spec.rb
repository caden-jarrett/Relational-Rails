require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do
  it 'displays the lead actors name and if they have a Oscar' do

    lead_actor = LeadActor.create!(name: "Daniel Radcliffe", oscar: false, age: 12)
    visit "/lead_actors/#{lead_actor.id}"

    expect(page).to have_content(lead_actor.name)
    expect(page).to have_content("Has received an Oscar: #{lead_actor.oscar}")
  end
end
