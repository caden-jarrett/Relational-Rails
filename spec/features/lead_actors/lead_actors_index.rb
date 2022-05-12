require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do
  it 'displays the lead actors name and if they have a Oscar' do
    # binding.pry
    lead_actor_1 = LeadActor.create!(name: "Daniel Radcliffe", oscar: false, age: 32)
    lead_actor_2 = LeadActor.create!(name: "Matt Damon", oscar: true, age: 51)
    lead_actor_3 = LeadActor.create!(name: "Adam Sandler", oscar: false, age: 55)

    visit "/lead_actors"
    # binding.pry
    expect(page).to have_content(lead_actor_1.name)
    expect(page).to have_content("Has received an Oscar: #{lead_actor_1.oscar}")
    expect(page).to have_content(lead_actor_2.name)
    expect(page).to have_content("Has received an Oscar: #{lead_actor_2.oscar}")
    expect(page).to have_content(lead_actor_3.name)
    expect(page).to have_content("Has received an Oscar: #{lead_actor_3.oscar}")
  end
end
