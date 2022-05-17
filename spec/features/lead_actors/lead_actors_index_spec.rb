require "rails_helper"

RSpec.describe 'the lead actors index page', type: :feature do

  before :each do
    @lead_actor_1 = LeadActor.create!(name: "Daniel Radcliffe",
                                      oscar: false,
                                      age: 32,
                                      created_at: 3.seconds.ago)
    @lead_actor_2 = LeadActor.create!(name: "Matt Damon",
                                      oscar: true,
                                      age: 51,
                                      created_at: 1.seconds.ago)
    @lead_actor_3 = LeadActor.create!(name: "Adam Sandler",
                                      oscar: false,
                                      age: 55,
                                      created_at: 2.seconds.ago)
  end
  it 'displays the lead actors name in the parent index' do

    visit "/lead_actors"

    expect(page).to have_content("Lead Actors")
    expect(page).to have_content(@lead_actor_2.name)
    expect(page).to have_content(@lead_actor_2.created_at)

    expect(page).to have_content(@lead_actor_3.name)
    expect(page).to have_content(@lead_actor_3.created_at)

    expect(page).to have_content(@lead_actor_1.name)
    expect(page).to have_content(@lead_actor_1.created_at)

  end

  it 'links to each lead actor to their show page' do

    visit "/lead_actors"

    click_on @lead_actor_1.name

    expect(current_path). to eq("/lead_actors/#{@lead_actor_1.id}")
  end
end
