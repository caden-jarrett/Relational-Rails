require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do

  before :each do
    @lead_actor_1 = LeadActor.create!(name: "Daniel Radcliffe", oscar: false, age: 32)
    @lead_actor_2 = LeadActor.create!(name: "Matt Damon", oscar: true, age: 51)
    @lead_actor_3 = LeadActor.create!(name: "Adam Sandler", oscar: false, age: 55)
  end
  it 'displays the lead actors name and if they have a Oscar' do

    visit "/lead_actors"

    expect(page).to have_content("Lead Actors")
    expect(page).to have_content(@lead_actor_3.name)
    expect(page).to have_content(@lead_actor_1.name)
    expect(page).to have_content(@lead_actor_2.name)
  end

  it 'links to each lead actor show page' do
    visit "/lead_actors"

    click_on @lead_actor_1.name

    expect(current_path). to eq("/lead_actors/#{@lead_actor_1.id}/movies")
  end
end
